    addi x1, x0, 17
    beq x0, x0, label_a
    addi x1, x1, 7
    addi x1, x1, 7
    addi x1, x1, 7
    addi x1, x1, 7
label_a: addi x1, x1, 17
    addi x1, x1, 16
    addi x1, x1, 16
    addi x1, x1, 16
    beq x0, x0, label_a
    addi x1, x1, 1