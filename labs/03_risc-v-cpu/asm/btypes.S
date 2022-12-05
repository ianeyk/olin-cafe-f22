    addi x1, x0, 17
    # beq x0, x0, label_a
    jal x2, label_a
    add x3, x1, x0
    add x3, x1, x0
    add x3, x1, x0
    add x3, x1, x0
label_a: addi x1, x1, 17
    addi x1, x1, 16
    addi x1, x1, 16
    addi x1, x1, 16
    # jalr x4, x2, 0
    bne x0, x0, label_a
    blt x1, x0, label_a
    # blt x0, x1, label_a
    bltu x1, x0, label_a
    # bge x1, x0, label_a
    addi x4, x1, 1
    # bltu x0, x1, label_a
    bge x0, x1, label_a
    bgeu x0, x1, label_a
    addi x4, x1, 4
    # bgeu x1, x0, label_a
    addi x5, x1, 1
    bgeu x1, x0, label_a