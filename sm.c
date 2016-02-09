#include <stdio.h>
#include <prussdrv.h>
#include <pruss_intc_mapping.h>

int main(int argc, char **argv)
{

    if (argc != 2)
    {
        printf("Usage: %s sm.bin\n", argv[0]);
        return 1;
    }

    prussdrv_init();
    if (prussdrv_open(PRU_EVTOUT_0) == -1)
    {
        printf("prussdrv_open() failed\n");
        return 1;
    }

	unsigned int SM_delay=10000;
	unsigned int SM_steps=1000000;
	unsigned int SM_direction=0;

      unsigned int SM_control[3];
	SM_control[0]=SM_delay;
	SM_control[1]=SM_steps;
	SM_control[2]=SM_direction;
      prussdrv_pru_write_memory(PRUSS0_PRU0_DATARAM, 0,SM_control, 12);



    tpruss_intc_initdata pruss_intc_initdata = PRUSS_INTC_INITDATA;
    prussdrv_pruintc_init(&pruss_intc_initdata);


    int which_pru = 0;
    printf("Executing program and waiting for termination\n");
    prussdrv_exec_program(which_pru, argv[1]);

    prussdrv_pru_wait_event(PRU_EVTOUT_0);
    printf("All done\n");

    prussdrv_pru_disable(which_pru);
    prussdrv_exit();

    return 0;
}

