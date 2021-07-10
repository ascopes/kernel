#define SCREEN_WIDTH 80
#define SCREEN_HEIGHT 60

static inline void write_char(const char c, const unsigned int index)
{
    char *const video_ptr = ((char*) 0xb8000);
    unsigned int fbf_index = index * 2;

    video_ptr[fbf_index++] = c;
    video_ptr[fbf_index++] = 0x07;
}

void clear(void)
{
    unsigned idx = 0;
    
    while (idx < SCREEN_WIDTH * SCREEN_HEIGHT)
    {
        write_char(' ', idx++);
    }
}

void write(const char *const str)
{
    unsigned str_idx = 0;

    while (str[str_idx] != '\0')
    {
        write_char(str[str_idx], str_idx);
        str_idx++;
    }
}

void kmain(void) 
{
    clear();
    write("Hello, World!");
}
