#ifdef __cplusplus
extern "C"
{
#endif
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#ifdef __cplusplus
}
#endif

int main(void)
{
    // Example setup for an LED on an STM32F103RB
    rcc_periph_clock_enable(RCC_GPIOC);
    gpio_set_mode(GPIOC, GPIO_MODE_OUTPUT_2_MHZ,
                  GPIO_CNF_OUTPUT_PUSHPULL, GPIO13);

    while (1)
    {
        gpio_toggle(GPIOC, GPIO13); // Toggle LED
        for (int i = 0; i < 800000; i++)
        { // Simple delay loop
            __asm__("nop");
        }
    }
    return 0;
}
