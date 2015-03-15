#define GDBCON  (*(unsigned int *)0x56000010)
#define GDBDAT  (*(unsigned int *)0x56000014)

void delay(void)
{
    int i = 10000;
    for(;i>0; i--);
}

void main(void)
{
    int count = 0;
    // 设置GDB5\6\7\8 为输出
    GDBCON = 0x55<<10;
    
    while(1)
    {
        // 将数据写入寄存器中，控制管脚电平
        GDBDAT = ~(count<<5);
        
        count++;
        if(16 == count)
            count = 0;
        delay();
    }

}
