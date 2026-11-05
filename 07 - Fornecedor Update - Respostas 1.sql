USE produto;
DROP TABLE IF EXISTS Produto;

CREATE TABLE Produto (
    id                INT AUTO_INCREMENT,
    cnpj_fornecedor   VARCHAR(14) NOT NULL,
    nome              VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO Produto (id, cnpj_fornecedor, nome) VALUES
(1, '11111111000101', 'arroz tipo 1 5kg'),
(2, '11111111000101', 'feijao carioca 1kg'),
(3, '22222222000102', 'refrigerante cola 2l'),
(4, '33333333000103', 'macarrao espaguete'),
(5, '44444444000104', 'suco de laranja 1l'),
(6, '77777777000107', 'fone de ouvido bluetooth'),
(7, '77777777000107', 'carregador usb-c');

UPDATE Produto
SET nome = 'Arroz Tipo 1 5kg'
WHERE id = 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE Produto
SET nome = CONCAT('[Eletrônico] ', nome)
WHERE nome LIKE '%usb-c%';

UPDATE Produto
SET cnpj_fornecedor = '11111111000101'
WHERE id IN (6, 7);

UPDATE Produto
SET nome = CASE id
WHEN 2 THEN CONCAT('[Produto 2] ', nome)
WHEN 3 THEN CONCAT('[Produto 3] ', nome)
WHEN 4 THEN CONCAT('[Produto 4] ', nome)
ELSE nome
END
WHERE id IN (2, 3, 4);

SELECT * FROM Produto;