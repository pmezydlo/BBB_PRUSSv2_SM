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

