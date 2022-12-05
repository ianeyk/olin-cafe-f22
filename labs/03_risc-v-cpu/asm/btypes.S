    addi x1, x0, 17
    # beq x0, x0, label_a
    jal x2, label_a
    add x1, x1, x0
    add x1, x1, x0
    add x1, x1, x0
    add x1, x1, x0
label_a: addi x1, x1, 17
    addi x1, x1, 16
    addi x1, x1, 16
    addi x1, x1, 16
    beq x0, x0, label_a
    addi x1, x1, 1