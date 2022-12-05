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
    jalr x4, x2, 0
    beq x0, x0, label_a
    addi x1, x1, 1