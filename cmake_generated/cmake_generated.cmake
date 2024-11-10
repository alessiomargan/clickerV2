# This is converter generated file, and shall not be touched by user
#
# It is always re-generated if converter script is called multiple times
# Use CMakeLists.txt to apply user changes
cmake_minimum_required(VERSION 3.22)

# Core MCU flags, CPU, instruction set and FPU setup
set(cpu_PARAMS ${cpu_PARAMS}
    -mthumb

    # -mcpu, -mfloat, -mfloat-abi config
    -mcpu=cortex-m4
    -mfloat-abi=hard
    -mfpu=fpv4-sp-d16
)

# Linker script
set(linker_script_SRC ${linker_script_SRC} ${CMAKE_CURRENT_SOURCE_DIR}/STM32F407VGTX_FLASH.ld)

# Sources
set(sources_SRCS ${sources_SRCS}
    #${CMAKE_CURRENT_SOURCE_DIR}/CMakeFiles/3.28.1/CompilerIdC/CMakeCCompilerId.c
    #${CMAKE_CURRENT_SOURCE_DIR}/CMakeFiles/3.28.1/CompilerIdCXX/CMakeCXXCompilerId.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/stm32f4xx_hal_msp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/stm32f4xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/syscalls.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/sysmem.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/system_stm32f4xx.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Startup/startup_stm32f407vgtx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_crc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
    ${GIT_SOES}/soes/ecat_slv.c
    ${GIT_SOES}/soes/esc.c
    ${GIT_SOES}/soes/esc_coe.c
    ${GIT_SOES}/soes/esc_eep.c
    ${GIT_SOES}/soes/esc_eoe.c
    ${GIT_SOES}/soes/esc_foe.c
    ${GIT_SOES}/soes/hal/advr_esc/esc_hw_lan9252.c
    ${GIT_SOES}/soes/hal/advr_esc/esc_hw_lan9252_spi.c
    ${GIT_SOES}/soes/hal/advr_esc/hal_ec_STM32F4xx.c
    ${GIT_UC_TEST}/common_src/soes_test/globals.c
    ${GIT_UC_TEST}/common_src/soes_test/objectlist.c
    ${GIT_UC_TEST}/common_src/soes_test/params.c
    ${GIT_UC_TEST}/common_src/soes_test/soes_hook.c
    ${GIT_UC_TEST}/stm32f4xx/soes_test/flash_utils.c
    ${GIT_UC_TEST}/stm32f4xx/soes_test/user_code.c
)

# Include directories
set(include_c_DIRS ${include_c_DIRS}
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32F4xx/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
    ${GIT_SOES}/
    ${GIT_SOES}/soes/include/sys/gcc
    ${GIT_UC_TEST}/common_src/soes_test/include
    ${GIT_UC_TEST}/stm32f4xx/soes_test/include
)
set(include_cxx_DIRS ${include_cxx_DIRS})
set(include_asm_DIRS ${include_asm_DIRS}
    ${GIT_SOES}/soes/include/sys/gcc
    ${GIT_UC_TEST}/common_src/soes_test/include
)

# Symbols definition
set(symbols_c_SYMB ${symbols_c_SYMB}
    "DEBUG"
    "STM32F407xx"
    "USE_HAL_DRIVER"
)
set(symbols_cxx_SYMB ${symbols_cxx_SYMB})
set(symbols_asm_SYMB ${symbols_asm_SYMB}
    "DEBUG"
)

# Link directories
set(link_DIRS ${link_DIRS})

# Link libraries
set(link_LIBS ${link_LIBS})

# Compiler options
set(compiler_OPTS ${compiler_OPTS})

# Linker options
set(linker_OPTS ${linker_OPTS})
