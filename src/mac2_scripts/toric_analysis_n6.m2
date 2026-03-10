-- Macaulay2 code for toric ideal analysis
-- Generated from graph_counter_v10_simplified.py
-- Analyzing graphs on n=6 vertices containing the chosen induced subgraph

-- ===== Graph 1 =====
-- Edges: [(0, 2), (0, 3), (1, 2), (1, 3)]
-- Canonical form: ((0, 1), (0, 2), (1, 3), (2, 3))

-- Create a polynomial ring for edges
R1 = QQ[x1, x2, x3, x4];

-- Create a polynomial ring for vertices
S1 = QQ[t1, t2, t3, t4];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t2*t3  (edge {2,3})
-- x4 -> t2*t4  (edge {2,4})

phi1 = map(S1, R1, {t1*t3, t1*t4, t2*t3, t2*t4});

-- The toric ideal is the kernel of this map
I1 = kernel phi1;

J1 = ideal mingens I1;

-- Print results (using minimal generating set)
print("Graph 1: ");
print("  Regularity = " | toString(regularity I1));
print("  Number of generators (mingens) = " | toString(numgens J1));
print("  Degrees of generators (mingens) = " | toString(degrees J1));
print("  Minimal generators: " | toString J1);

--------------------------------------------------

-- ===== Graph 2 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (1, 2), (1, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (2, 4))

-- Create a polynomial ring for edges
R2 = QQ[x1, x2, x3, x4, x5];

-- Create a polynomial ring for vertices
S2 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})

phi2 = map(S2, R2, {t1*t3, t1*t4, t1*t5, t2*t3, t2*t4});

-- The toric ideal is the kernel of this map
I2 = kernel phi2;

J2 = ideal mingens I2;

-- Print results (using minimal generating set)
print("Graph 2: ");
print("  Regularity = " | toString(regularity I2));
print("  Number of generators (mingens) = " | toString(numgens J2));
print("  Degrees of generators (mingens) = " | toString(degrees J2));
print("  Minimal generators: " | toString J2);

--------------------------------------------------

-- ===== Graph 3 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 5), (2, 5))

-- Create a polynomial ring for edges
R3 = QQ[x1, x2, x3, x4, x5, x6];

-- Create a polynomial ring for vertices
S3 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})

phi3 = map(S3, R3, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4});

-- The toric ideal is the kernel of this map
I3 = kernel phi3;

J3 = ideal mingens I3;

-- Print results (using minimal generating set)
print("Graph 3: ");
print("  Regularity = " | toString(regularity I3));
print("  Number of generators (mingens) = " | toString(numgens J3));
print("  Degrees of generators (mingens) = " | toString(degrees J3));
print("  Minimal generators: " | toString J3);

--------------------------------------------------

-- ===== Graph 4 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (2, 4), (3, 4))

-- Create a polynomial ring for edges
R4 = QQ[x1, x2, x3, x4, x5, x6];

-- Create a polynomial ring for vertices
S4 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})

phi4 = map(S4, R4, {t1*t3, t1*t4, t1*t5, t2*t3, t2*t4, t2*t5});

-- The toric ideal is the kernel of this map
I4 = kernel phi4;

J4 = ideal mingens I4;

-- Print results (using minimal generating set)
print("Graph 4: ");
print("  Regularity = " | toString(regularity I4));
print("  Number of generators (mingens) = " | toString(numgens J4));
print("  Degrees of generators (mingens) = " | toString(degrees J4));
print("  Minimal generators: " | toString J4);

--------------------------------------------------

-- ===== Graph 5 =====
-- Edges: [(0, 2), (0, 3), (0, 5), (1, 2), (1, 3), (1, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (2, 4), (4, 5))

-- Create a polynomial ring for edges
R5 = QQ[x1, x2, x3, x4, x5, x6];

-- Create a polynomial ring for vertices
S5 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})

phi5 = map(S5, R5, {t1*t3, t1*t4, t1*t6, t2*t3, t2*t4, t2*t5});

-- The toric ideal is the kernel of this map
I5 = kernel phi5;

J5 = ideal mingens I5;

-- Print results (using minimal generating set)
print("Graph 5: ");
print("  Regularity = " | toString(regularity I5));
print("  Number of generators (mingens) = " | toString(numgens J5));
print("  Degrees of generators (mingens) = " | toString(degrees J5));
print("  Minimal generators: " | toString J5);

--------------------------------------------------

-- ===== Graph 6 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 5), (2, 5), (3, 5))

-- Create a polynomial ring for edges
R6 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S6 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})

phi6 = map(S6, R6, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5});

-- The toric ideal is the kernel of this map
I6 = kernel phi6;

J6 = ideal mingens I6;

-- Print results (using minimal generating set)
print("Graph 6: ");
print("  Regularity = " | toString(regularity I6));
print("  Number of generators (mingens) = " | toString(numgens J6));
print("  Degrees of generators (mingens) = " | toString(degrees J6));
print("  Minimal generators: " | toString J6);

--------------------------------------------------

-- ===== Graph 7 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 5), (2, 5), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R7 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S7 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})

phi7 = map(S7, R7, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t2*t6});

-- The toric ideal is the kernel of this map
I7 = kernel phi7;

J7 = ideal mingens I7;

-- Print results (using minimal generating set)
print("Graph 7: ");
print("  Regularity = " | toString(regularity I7));
print("  Number of generators (mingens) = " | toString(numgens J7));
print("  Degrees of generators (mingens) = " | toString(degrees J7));
print("  Minimal generators: " | toString J7);

--------------------------------------------------

-- ===== Graph 8 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (1, 2), (1, 4), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 4), (3, 4))

-- Create a polynomial ring for edges
R8 = QQ[x1, x2, x3, x4, x5, x6];

-- Create a polynomial ring for vertices
S8 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t3*t4  (edge {3,4})

phi8 = map(S8, R8, {t1*t2, t1*t4, t1*t5, t2*t3, t2*t5, t3*t4});

-- The toric ideal is the kernel of this map
I8 = kernel phi8;

J8 = ideal mingens I8;

-- Print results (using minimal generating set)
print("Graph 8: ");
print("  Regularity = " | toString(regularity I8));
print("  Number of generators (mingens) = " | toString(numgens J8));
print("  Degrees of generators (mingens) = " | toString(degrees J8));
print("  Minimal generators: " | toString J8);

--------------------------------------------------

-- ===== Graph 9 =====
-- Edges: [(0, 1), (0, 3), (0, 5), (1, 2), (1, 4), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (1, 5), (2, 4))

-- Create a polynomial ring for edges
R9 = QQ[x1, x2, x3, x4, x5, x6];

-- Create a polynomial ring for vertices
S9 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t3*t4  (edge {3,4})

phi9 = map(S9, R9, {t1*t2, t1*t4, t1*t6, t2*t3, t2*t5, t3*t4});

-- The toric ideal is the kernel of this map
I9 = kernel phi9;

J9 = ideal mingens I9;

-- Print results (using minimal generating set)
print("Graph 9: ");
print("  Regularity = " | toString(regularity I9));
print("  Number of generators (mingens) = " | toString(numgens J9));
print("  Degrees of generators (mingens) = " | toString(degrees J9));
print("  Minimal generators: " | toString J9);

--------------------------------------------------

-- ===== Graph 10 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 2), (1, 4), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 5), (3, 5))

-- Create a polynomial ring for edges
R10 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S10 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t3*t4  (edge {3,4})

phi10 = map(S10, R10, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t3, t2*t5, t3*t4});

-- The toric ideal is the kernel of this map
I10 = kernel phi10;

J10 = ideal mingens I10;

-- Print results (using minimal generating set)
print("Graph 10: ");
print("  Regularity = " | toString(regularity I10));
print("  Number of generators (mingens) = " | toString(numgens J10));
print("  Degrees of generators (mingens) = " | toString(degrees J10));
print("  Minimal generators: " | toString J10);

--------------------------------------------------

-- ===== Graph 11 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 4), (3, 4))

-- Create a polynomial ring for edges
R11 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S11 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t3*t4  (edge {3,4})

phi11 = map(S11, R11, {t1*t3, t1*t4, t1*t5, t2*t3, t2*t4, t2*t5, t3*t4});

-- The toric ideal is the kernel of this map
I11 = kernel phi11;

J11 = ideal mingens I11;

-- Print results (using minimal generating set)
print("Graph 11: ");
print("  Regularity = " | toString(regularity I11));
print("  Number of generators (mingens) = " | toString(numgens J11));
print("  Degrees of generators (mingens) = " | toString(degrees J11));
print("  Minimal generators: " | toString J11);

--------------------------------------------------

-- ===== Graph 12 =====
-- Edges: [(0, 2), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 4), (3, 4), (3, 5))

-- Create a polynomial ring for edges
R12 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S12 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t3*t4  (edge {3,4})

phi12 = map(S12, R12, {t1*t3, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t3*t4});

-- The toric ideal is the kernel of this map
I12 = kernel phi12;

J12 = ideal mingens I12;

-- Print results (using minimal generating set)
print("Graph 12: ");
print("  Regularity = " | toString(regularity I12));
print("  Number of generators (mingens) = " | toString(numgens J12));
print("  Degrees of generators (mingens) = " | toString(degrees J12));
print("  Minimal generators: " | toString J12);

--------------------------------------------------

-- ===== Graph 13 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 5), (2, 5), (3, 5))

-- Create a polynomial ring for edges
R13 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S13 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t3*t4  (edge {3,4})

phi13 = map(S13, R13, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t3*t4});

-- The toric ideal is the kernel of this map
I13 = kernel phi13;

J13 = ideal mingens I13;

-- Print results (using minimal generating set)
print("Graph 13: ");
print("  Regularity = " | toString(regularity I13));
print("  Number of generators (mingens) = " | toString(numgens J13));
print("  Degrees of generators (mingens) = " | toString(degrees J13));
print("  Minimal generators: " | toString J13);

--------------------------------------------------

-- ===== Graph 14 =====
-- Edges: [(0, 4), (0, 5), (1, 4), (1, 5), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (1, 3), (2, 3), (4, 5))

-- Create a polynomial ring for edges
R14 = QQ[x1, x2, x3, x4, x5];

-- Create a polynomial ring for vertices
S14 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t5  (edge {1,5})
-- x2 -> t1*t6  (edge {1,6})
-- x3 -> t2*t5  (edge {2,5})
-- x4 -> t2*t6  (edge {2,6})
-- x5 -> t3*t4  (edge {3,4})

phi14 = map(S14, R14, {t1*t5, t1*t6, t2*t5, t2*t6, t3*t4});

-- The toric ideal is the kernel of this map
I14 = kernel phi14;

J14 = ideal mingens I14;

-- Print results (using minimal generating set)
print("Graph 14: ");
print("  Regularity = " | toString(regularity I14));
print("  Number of generators (mingens) = " | toString(numgens J14));
print("  Degrees of generators (mingens) = " | toString(degrees J14));
print("  Minimal generators: " | toString J14);

--------------------------------------------------

-- ===== Graph 15 =====
-- Edges: [(0, 2), (0, 4), (0, 5), (1, 4), (1, 5), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (2, 4), (3, 5))

-- Create a polynomial ring for edges
R15 = QQ[x1, x2, x3, x4, x5, x6];

-- Create a polynomial ring for vertices
S15 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t5  (edge {2,5})
-- x5 -> t2*t6  (edge {2,6})
-- x6 -> t3*t4  (edge {3,4})

phi15 = map(S15, R15, {t1*t3, t1*t5, t1*t6, t2*t5, t2*t6, t3*t4});

-- The toric ideal is the kernel of this map
I15 = kernel phi15;

J15 = ideal mingens I15;

-- Print results (using minimal generating set)
print("Graph 15: ");
print("  Regularity = " | toString(regularity I15));
print("  Number of generators (mingens) = " | toString(numgens J15));
print("  Degrees of generators (mingens) = " | toString(degrees J15));
print("  Minimal generators: " | toString J15);

--------------------------------------------------

-- ===== Graph 16 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 4), (1, 5), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R16 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S16 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})

phi16 = map(S16, R16, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t5, t2*t6, t3*t4});

-- The toric ideal is the kernel of this map
I16 = kernel phi16;

J16 = ideal mingens I16;

-- Print results (using minimal generating set)
print("Graph 16: ");
print("  Regularity = " | toString(regularity I16));
print("  Number of generators (mingens) = " | toString(numgens J16));
print("  Degrees of generators (mingens) = " | toString(degrees J16));
print("  Minimal generators: " | toString J16);

--------------------------------------------------

-- ===== Graph 17 =====
-- Edges: [(0, 2), (0, 4), (0, 5), (1, 2), (1, 4), (1, 5), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (1, 5), (2, 4), (2, 5))

-- Create a polynomial ring for edges
R17 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S17 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})

phi17 = map(S17, R17, {t1*t3, t1*t5, t1*t6, t2*t3, t2*t5, t2*t6, t3*t4});

-- The toric ideal is the kernel of this map
I17 = kernel phi17;

J17 = ideal mingens I17;

-- Print results (using minimal generating set)
print("Graph 17: ");
print("  Regularity = " | toString(regularity I17));
print("  Number of generators (mingens) = " | toString(numgens J17));
print("  Degrees of generators (mingens) = " | toString(degrees J17));
print("  Minimal generators: " | toString J17);

--------------------------------------------------

-- ===== Graph 18 =====
-- Edges: [(0, 3), (0, 4), (0, 5), (1, 2), (1, 4), (1, 5), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (2, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R18 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S18 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t4  (edge {1,4})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})

phi18 = map(S18, R18, {t1*t4, t1*t5, t1*t6, t2*t3, t2*t5, t2*t6, t3*t4});

-- The toric ideal is the kernel of this map
I18 = kernel phi18;

J18 = ideal mingens I18;

-- Print results (using minimal generating set)
print("Graph 18: ");
print("  Regularity = " | toString(regularity I18));
print("  Number of generators (mingens) = " | toString(numgens J18));
print("  Degrees of generators (mingens) = " | toString(degrees J18));
print("  Minimal generators: " | toString J18);

--------------------------------------------------

-- ===== Graph 19 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 2), (1, 4), (1, 5), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 5), (4, 5))

-- Create a polynomial ring for edges
R19 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S19 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})

phi19 = map(S19, R19, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t3, t2*t5, t2*t6, t3*t4});

-- The toric ideal is the kernel of this map
I19 = kernel phi19;

J19 = ideal mingens I19;

-- Print results (using minimal generating set)
print("Graph 19: ");
print("  Regularity = " | toString(regularity I19));
print("  Number of generators (mingens) = " | toString(numgens J19));
print("  Degrees of generators (mingens) = " | toString(degrees J19));
print("  Minimal generators: " | toString J19);

--------------------------------------------------

-- ===== Graph 20 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 4), (1, 5), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 5), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R20 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S20 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})

phi20 = map(S20, R20, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t5, t2*t6, t3*t4});

-- The toric ideal is the kernel of this map
I20 = kernel phi20;

J20 = ideal mingens I20;

-- Print results (using minimal generating set)
print("Graph 20: ");
print("  Regularity = " | toString(regularity I20));
print("  Number of generators (mingens) = " | toString(numgens J20));
print("  Degrees of generators (mingens) = " | toString(degrees J20));
print("  Minimal generators: " | toString J20);

--------------------------------------------------

-- ===== Graph 21 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 5), (2, 5), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R21 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S21 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t4  (edge {3,4})

phi21 = map(S21, R21, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t2*t6, t3*t4});

-- The toric ideal is the kernel of this map
I21 = kernel phi21;

J21 = ideal mingens I21;

-- Print results (using minimal generating set)
print("Graph 21: ");
print("  Regularity = " | toString(regularity I21));
print("  Number of generators (mingens) = " | toString(numgens J21));
print("  Degrees of generators (mingens) = " | toString(degrees J21));
print("  Minimal generators: " | toString J21);

--------------------------------------------------

-- ===== Graph 22 =====
-- Edges: [(0, 1), (0, 2), (0, 3), (0, 4), (1, 3), (1, 4), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (2, 4), (3, 4))

-- Create a polynomial ring for edges
R22 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S22 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t4  (edge {1,4})
-- x4 -> t1*t5  (edge {1,5})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})

phi22 = map(S22, R22, {t1*t2, t1*t3, t1*t4, t1*t5, t2*t4, t2*t5, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I22 = kernel phi22;

J22 = ideal mingens I22;

-- Print results (using minimal generating set)
print("Graph 22: ");
print("  Regularity = " | toString(regularity I22));
print("  Number of generators (mingens) = " | toString(numgens J22));
print("  Degrees of generators (mingens) = " | toString(degrees J22));
print("  Minimal generators: " | toString J22);

--------------------------------------------------

-- ===== Graph 23 =====
-- Edges: [(0, 1), (0, 3), (0, 5), (1, 3), (1, 4), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 4), (2, 5), (3, 4))

-- Create a polynomial ring for edges
R23 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S23 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t4  (edge {2,4})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t3*t4  (edge {3,4})
-- x7 -> t3*t5  (edge {3,5})

phi23 = map(S23, R23, {t1*t2, t1*t4, t1*t6, t2*t4, t2*t5, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I23 = kernel phi23;

J23 = ideal mingens I23;

-- Print results (using minimal generating set)
print("Graph 23: ");
print("  Regularity = " | toString(regularity I23));
print("  Number of generators (mingens) = " | toString(numgens J23));
print("  Degrees of generators (mingens) = " | toString(degrees J23));
print("  Minimal generators: " | toString J23);

--------------------------------------------------

-- ===== Graph 24 =====
-- Edges: [(0, 1), (0, 2), (0, 3), (0, 5), (1, 3), (1, 4), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (2, 5), (3, 5))

-- Create a polynomial ring for edges
R24 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S24 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t4  (edge {1,4})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})

phi24 = map(S24, R24, {t1*t2, t1*t3, t1*t4, t1*t6, t2*t4, t2*t5, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I24 = kernel phi24;

J24 = ideal mingens I24;

-- Print results (using minimal generating set)
print("Graph 24: ");
print("  Regularity = " | toString(regularity I24));
print("  Number of generators (mingens) = " | toString(numgens J24));
print("  Degrees of generators (mingens) = " | toString(degrees J24));
print("  Minimal generators: " | toString J24);

--------------------------------------------------

-- ===== Graph 25 =====
-- Edges: [(0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (2, 4), (3, 4))

-- Create a polynomial ring for edges
R25 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S25 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t4  (edge {1,4})
-- x4 -> t1*t5  (edge {1,5})
-- x5 -> t1*t6  (edge {1,6})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t5  (edge {3,5})

phi25 = map(S25, R25, {t1*t2, t1*t3, t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I25 = kernel phi25;

J25 = ideal mingens I25;

-- Print results (using minimal generating set)
print("Graph 25: ");
print("  Regularity = " | toString(regularity I25));
print("  Number of generators (mingens) = " | toString(numgens J25));
print("  Degrees of generators (mingens) = " | toString(degrees J25));
print("  Minimal generators: " | toString J25);

--------------------------------------------------

-- ===== Graph 26 =====
-- Edges: [(0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 4), (3, 4), (4, 5))

-- Create a polynomial ring for edges
R26 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S26 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t4  (edge {1,4})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})

phi26 = map(S26, R26, {t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I26 = kernel phi26;

J26 = ideal mingens I26;

-- Print results (using minimal generating set)
print("Graph 26: ");
print("  Regularity = " | toString(regularity I26));
print("  Number of generators (mingens) = " | toString(numgens J26));
print("  Degrees of generators (mingens) = " | toString(degrees J26));
print("  Minimal generators: " | toString J26);

--------------------------------------------------

-- ===== Graph 27 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 5), (2, 4), (3, 4))

-- Create a polynomial ring for edges
R27 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S27 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t5  (edge {3,5})

phi27 = map(S27, R27, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I27 = kernel phi27;

J27 = ideal mingens I27;

-- Print results (using minimal generating set)
print("Graph 27: ");
print("  Regularity = " | toString(regularity I27));
print("  Number of generators (mingens) = " | toString(numgens J27));
print("  Degrees of generators (mingens) = " | toString(degrees J27));
print("  Minimal generators: " | toString J27);

--------------------------------------------------

-- ===== Graph 28 =====
-- Edges: [(0, 1), (0, 2), (0, 4), (0, 5), (1, 3), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 5), (3, 4), (3, 5))

-- Create a polynomial ring for edges
R28 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S28 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})

phi28 = map(S28, R28, {t1*t2, t1*t3, t1*t5, t1*t6, t2*t4, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I28 = kernel phi28;

J28 = ideal mingens I28;

-- Print results (using minimal generating set)
print("Graph 28: ");
print("  Regularity = " | toString(regularity I28));
print("  Number of generators (mingens) = " | toString(numgens J28));
print("  Degrees of generators (mingens) = " | toString(degrees J28));
print("  Minimal generators: " | toString J28);

--------------------------------------------------

-- ===== Graph 29 =====
-- Edges: [(0, 3), (0, 4), (0, 5), (1, 3), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (1, 5), (2, 4), (3, 5))

-- Create a polynomial ring for edges
R29 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S29 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t4  (edge {1,4})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t4  (edge {2,4})
-- x5 -> t2*t6  (edge {2,6})
-- x6 -> t3*t4  (edge {3,4})
-- x7 -> t3*t5  (edge {3,5})

phi29 = map(S29, R29, {t1*t4, t1*t5, t1*t6, t2*t4, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I29 = kernel phi29;

J29 = ideal mingens I29;

-- Print results (using minimal generating set)
print("Graph 29: ");
print("  Regularity = " | toString(regularity I29));
print("  Number of generators (mingens) = " | toString(numgens J29));
print("  Degrees of generators (mingens) = " | toString(degrees J29));
print("  Minimal generators: " | toString J29);

--------------------------------------------------

-- ===== Graph 30 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 3), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (2, 5), (4, 5))

-- Create a polynomial ring for edges
R30 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S30 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})

phi30 = map(S30, R30, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t4, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I30 = kernel phi30;

J30 = ideal mingens I30;

-- Print results (using minimal generating set)
print("Graph 30: ");
print("  Regularity = " | toString(regularity I30));
print("  Number of generators (mingens) = " | toString(numgens J30));
print("  Degrees of generators (mingens) = " | toString(degrees J30));
print("  Minimal generators: " | toString J30);

--------------------------------------------------

-- ===== Graph 31 =====
-- Edges: [(0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 4), (2, 5), (3, 4), (3, 5))

-- Create a polynomial ring for edges
R31 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S31 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t4  (edge {1,4})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})

phi31 = map(S31, R31, {t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I31 = kernel phi31;

J31 = ideal mingens I31;

-- Print results (using minimal generating set)
print("Graph 31: ");
print("  Regularity = " | toString(regularity I31));
print("  Number of generators (mingens) = " | toString(numgens J31));
print("  Degrees of generators (mingens) = " | toString(degrees J31));
print("  Minimal generators: " | toString J31);

--------------------------------------------------

-- ===== Graph 32 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 5), (2, 4), (4, 5))

-- Create a polynomial ring for edges
R32 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S32 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t5  (edge {3,5})

phi32 = map(S32, R32, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I32 = kernel phi32;

J32 = ideal mingens I32;

-- Print results (using minimal generating set)
print("Graph 32: ");
print("  Regularity = " | toString(regularity I32));
print("  Number of generators (mingens) = " | toString(numgens J32));
print("  Degrees of generators (mingens) = " | toString(degrees J32));
print("  Minimal generators: " | toString J32);

--------------------------------------------------

-- ===== Graph 33 =====
-- Edges: [(0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (1, 5), (2, 4), (2, 5), (3, 4))

-- Create a polynomial ring for edges
R33 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S33 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t4  (edge {1,4})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t4  (edge {2,4})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})

phi33 = map(S33, R33, {t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I33 = kernel phi33;

J33 = ideal mingens I33;

-- Print results (using minimal generating set)
print("Graph 33: ");
print("  Regularity = " | toString(regularity I33));
print("  Number of generators (mingens) = " | toString(numgens J33));
print("  Degrees of generators (mingens) = " | toString(degrees J33));
print("  Minimal generators: " | toString J33);

--------------------------------------------------

-- ===== Graph 34 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4), (2, 5), (3, 5))

-- Create a polynomial ring for edges
R34 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S34 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t5  (edge {3,5})

phi34 = map(S34, R34, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I34 = kernel phi34;

J34 = ideal mingens I34;

-- Print results (using minimal generating set)
print("Graph 34: ");
print("  Regularity = " | toString(regularity I34));
print("  Number of generators (mingens) = " | toString(numgens J34));
print("  Degrees of generators (mingens) = " | toString(degrees J34));
print("  Minimal generators: " | toString J34);

--------------------------------------------------

-- ===== Graph 35 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (2, 5), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R35 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S35 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t5  (edge {3,5})

phi35 = map(S35, R35, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I35 = kernel phi35;

J35 = ideal mingens I35;

-- Print results (using minimal generating set)
print("Graph 35: ");
print("  Regularity = " | toString(regularity I35));
print("  Number of generators (mingens) = " | toString(numgens J35));
print("  Degrees of generators (mingens) = " | toString(degrees J35));
print("  Minimal generators: " | toString J35);

--------------------------------------------------

-- ===== Graph 36 =====
-- Edges: [(0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (2, 5), (3, 5))

-- Create a polynomial ring for edges
R36 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];

-- Create a polynomial ring for vertices
S36 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t4  (edge {1,4})
-- x4 -> t1*t5  (edge {1,5})
-- x5 -> t1*t6  (edge {1,6})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t4  (edge {3,4})
-- x10 -> t3*t5  (edge {3,5})

phi36 = map(S36, R36, {t1*t2, t1*t3, t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I36 = kernel phi36;

J36 = ideal mingens I36;

-- Print results (using minimal generating set)
print("Graph 36: ");
print("  Regularity = " | toString(regularity I36));
print("  Number of generators (mingens) = " | toString(numgens J36));
print("  Degrees of generators (mingens) = " | toString(degrees J36));
print("  Minimal generators: " | toString J36);

--------------------------------------------------

-- ===== Graph 37 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 5), (2, 4), (3, 4), (4, 5))

-- Create a polynomial ring for edges
R37 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];

-- Create a polynomial ring for vertices
S37 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t4  (edge {3,4})
-- x10 -> t3*t5  (edge {3,5})

phi37 = map(S37, R37, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I37 = kernel phi37;

J37 = ideal mingens I37;

-- Print results (using minimal generating set)
print("Graph 37: ");
print("  Regularity = " | toString(regularity I37));
print("  Number of generators (mingens) = " | toString(numgens J37));
print("  Degrees of generators (mingens) = " | toString(degrees J37));
print("  Minimal generators: " | toString J37);

--------------------------------------------------

-- ===== Graph 38 =====
-- Edges: [(0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (1, 5), (2, 4), (2, 5), (3, 4), (3, 5))

-- Create a polynomial ring for edges
R38 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S38 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t4  (edge {1,4})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t4  (edge {2,4})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})
-- x9 -> t3*t6  (edge {3,6})

phi38 = map(S38, R38, {t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5, t3*t6});

-- The toric ideal is the kernel of this map
I38 = kernel phi38;

J38 = ideal mingens I38;

-- Print results (using minimal generating set)
print("Graph 38: ");
print("  Regularity = " | toString(regularity I38));
print("  Number of generators (mingens) = " | toString(numgens J38));
print("  Degrees of generators (mingens) = " | toString(degrees J38));
print("  Minimal generators: " | toString J38);

--------------------------------------------------

-- ===== Graph 39 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4), (2, 5), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R39 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];

-- Create a polynomial ring for vertices
S39 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t5  (edge {3,5})
-- x10 -> t3*t6  (edge {3,6})

phi39 = map(S39, R39, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5, t3*t6});

-- The toric ideal is the kernel of this map
I39 = kernel phi39;

J39 = ideal mingens I39;

-- Print results (using minimal generating set)
print("Graph 39: ");
print("  Regularity = " | toString(regularity I39));
print("  Number of generators (mingens) = " | toString(numgens J39));
print("  Degrees of generators (mingens) = " | toString(degrees J39));
print("  Minimal generators: " | toString J39);

--------------------------------------------------

-- ===== Graph 40 =====
-- Edges: [(0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (2, 5), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R40 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11];

-- Create a polynomial ring for vertices
S40 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t4  (edge {1,4})
-- x4 -> t1*t5  (edge {1,5})
-- x5 -> t1*t6  (edge {1,6})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t4  (edge {3,4})
-- x10 -> t3*t5  (edge {3,5})
-- x11 -> t3*t6  (edge {3,6})

phi40 = map(S40, R40, {t1*t2, t1*t3, t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5, t3*t6});

-- The toric ideal is the kernel of this map
I40 = kernel phi40;

J40 = ideal mingens I40;

-- Print results (using minimal generating set)
print("Graph 40: ");
print("  Regularity = " | toString(regularity I40));
print("  Number of generators (mingens) = " | toString(numgens J40));
print("  Degrees of generators (mingens) = " | toString(degrees J40));
print("  Minimal generators: " | toString J40);

--------------------------------------------------

-- ===== Graph 41 =====
-- Edges: [(0, 1), (0, 3), (0, 5), (1, 2), (1, 5), (2, 3), (2, 4), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 4), (3, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R41 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S41 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t6  (edge {2,6})
-- x6 -> t3*t4  (edge {3,4})
-- x7 -> t3*t5  (edge {3,5})
-- x8 -> t4*t5  (edge {4,5})

phi41 = map(S41, R41, {t1*t2, t1*t4, t1*t6, t2*t3, t2*t6, t3*t4, t3*t5, t4*t5});

-- The toric ideal is the kernel of this map
I41 = kernel phi41;

J41 = ideal mingens I41;

-- Print results (using minimal generating set)
print("Graph 41: ");
print("  Regularity = " | toString(regularity I41));
print("  Number of generators (mingens) = " | toString(numgens J41));
print("  Degrees of generators (mingens) = " | toString(degrees J41));
print("  Minimal generators: " | toString J41);

--------------------------------------------------

-- ===== Graph 42 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 2), (1, 5), (2, 3), (2, 4), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 5), (2, 5), (3, 4), (3, 5))

-- Create a polynomial ring for edges
R42 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S42 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})
-- x9 -> t4*t5  (edge {4,5})

phi42 = map(S42, R42, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t3, t2*t6, t3*t4, t3*t5, t4*t5});

-- The toric ideal is the kernel of this map
I42 = kernel phi42;

J42 = ideal mingens I42;

-- Print results (using minimal generating set)
print("Graph 42: ");
print("  Regularity = " | toString(regularity I42));
print("  Number of generators (mingens) = " | toString(numgens J42));
print("  Degrees of generators (mingens) = " | toString(degrees J42));
print("  Minimal generators: " | toString J42);

--------------------------------------------------

-- ===== Graph 43 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 5), (2, 3), (2, 4), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 5), (2, 3), (4, 5))

-- Create a polynomial ring for edges
R43 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S43 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})
-- x9 -> t4*t5  (edge {4,5})

phi43 = map(S43, R43, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t6, t3*t4, t3*t5, t4*t5});

-- The toric ideal is the kernel of this map
I43 = kernel phi43;

J43 = ideal mingens I43;

-- Print results (using minimal generating set)
print("Graph 43: ");
print("  Regularity = " | toString(regularity I43));
print("  Number of generators (mingens) = " | toString(numgens J43));
print("  Degrees of generators (mingens) = " | toString(degrees J43));
print("  Minimal generators: " | toString J43);

--------------------------------------------------

-- ===== Graph 44 =====
-- Edges: [(0, 2), (0, 4), (0, 5), (1, 2), (1, 3), (1, 5), (2, 3), (2, 4), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (2, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R44 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S44 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})
-- x9 -> t4*t5  (edge {4,5})

phi44 = map(S44, R44, {t1*t3, t1*t5, t1*t6, t2*t3, t2*t4, t2*t6, t3*t4, t3*t5, t4*t5});

-- The toric ideal is the kernel of this map
I44 = kernel phi44;

J44 = ideal mingens I44;

-- Print results (using minimal generating set)
print("Graph 44: ");
print("  Regularity = " | toString(regularity I44));
print("  Number of generators (mingens) = " | toString(numgens J44));
print("  Degrees of generators (mingens) = " | toString(degrees J44));
print("  Minimal generators: " | toString J44);

--------------------------------------------------

-- ===== Graph 45 =====
-- Edges: [(0, 1), (0, 2), (0, 4), (0, 5), (1, 2), (1, 3), (1, 5), (2, 3), (2, 4), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 5), (2, 4), (2, 5), (3, 4))

-- Create a polynomial ring for edges
R45 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];

-- Create a polynomial ring for vertices
S45 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t5  (edge {3,5})
-- x10 -> t4*t5  (edge {4,5})

phi45 = map(S45, R45, {t1*t2, t1*t3, t1*t5, t1*t6, t2*t3, t2*t4, t2*t6, t3*t4, t3*t5, t4*t5});

-- The toric ideal is the kernel of this map
I45 = kernel phi45;

J45 = ideal mingens I45;

-- Print results (using minimal generating set)
print("Graph 45: ");
print("  Regularity = " | toString(regularity I45));
print("  Number of generators (mingens) = " | toString(numgens J45));
print("  Degrees of generators (mingens) = " | toString(degrees J45));
print("  Minimal generators: " | toString J45);

--------------------------------------------------

-- ===== Graph 46 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 5), (2, 3), (2, 4), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4), (2, 3), (2, 5), (4, 5))

-- Create a polynomial ring for edges
R46 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];

-- Create a polynomial ring for vertices
S46 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t5  (edge {3,5})
-- x10 -> t4*t5  (edge {4,5})

phi46 = map(S46, R46, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t6, t3*t4, t3*t5, t4*t5});

-- The toric ideal is the kernel of this map
I46 = kernel phi46;

J46 = ideal mingens I46;

-- Print results (using minimal generating set)
print("Graph 46: ");
print("  Regularity = " | toString(regularity I46));
print("  Number of generators (mingens) = " | toString(numgens J46));
print("  Degrees of generators (mingens) = " | toString(degrees J46));
print("  Minimal generators: " | toString J46);

--------------------------------------------------

-- ===== Graph 47 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R47 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11];

-- Create a polynomial ring for vertices
S47 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t4  (edge {3,4})
-- x10 -> t3*t5  (edge {3,5})
-- x11 -> t4*t5  (edge {4,5})

phi47 = map(S47, R47, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5, t4*t5});

-- The toric ideal is the kernel of this map
I47 = kernel phi47;

J47 = ideal mingens I47;

-- Print results (using minimal generating set)
print("Graph 47: ");
print("  Regularity = " | toString(regularity I47));
print("  Number of generators (mingens) = " | toString(numgens J47));
print("  Degrees of generators (mingens) = " | toString(degrees J47));
print("  Minimal generators: " | toString J47);

--------------------------------------------------

-- ===== Graph 48 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 5), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 5), (2, 5), (3, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R48 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];

-- Create a polynomial ring for vertices
S48 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t6  (edge {3,6})
-- x10 -> t4*t5  (edge {4,5})

phi48 = map(S48, R48, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t2*t6, t3*t6, t4*t5});

-- The toric ideal is the kernel of this map
I48 = kernel phi48;

J48 = ideal mingens I48;

-- Print results (using minimal generating set)
print("Graph 48: ");
print("  Regularity = " | toString(regularity I48));
print("  Number of generators (mingens) = " | toString(numgens J48));
print("  Degrees of generators (mingens) = " | toString(degrees J48));
print("  Minimal generators: " | toString J48);

--------------------------------------------------

-- ===== Graph 49 =====
-- Edges: [(0, 3), (0, 4), (0, 5), (1, 2), (1, 4), (1, 5), (2, 3), (2, 5), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 4), (2, 5), (3, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R49 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9];

-- Create a polynomial ring for vertices
S49 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t4  (edge {1,4})
-- x2 -> t1*t5  (edge {1,5})
-- x3 -> t1*t6  (edge {1,6})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t2*t6  (edge {2,6})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t6  (edge {3,6})
-- x9 -> t4*t5  (edge {4,5})

phi49 = map(S49, R49, {t1*t4, t1*t5, t1*t6, t2*t3, t2*t5, t2*t6, t3*t4, t3*t6, t4*t5});

-- The toric ideal is the kernel of this map
I49 = kernel phi49;

J49 = ideal mingens I49;

-- Print results (using minimal generating set)
print("Graph 49: ");
print("  Regularity = " | toString(regularity I49));
print("  Number of generators (mingens) = " | toString(numgens J49));
print("  Degrees of generators (mingens) = " | toString(degrees J49));
print("  Minimal generators: " | toString J49);

--------------------------------------------------

-- ===== Graph 50 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 2), (1, 4), (1, 5), (2, 3), (2, 5), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 5), (2, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R50 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];

-- Create a polynomial ring for vertices
S50 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t6  (edge {3,6})
-- x10 -> t4*t5  (edge {4,5})

phi50 = map(S50, R50, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t3, t2*t5, t2*t6, t3*t4, t3*t6, t4*t5});

-- The toric ideal is the kernel of this map
I50 = kernel phi50;

J50 = ideal mingens I50;

-- Print results (using minimal generating set)
print("Graph 50: ");
print("  Regularity = " | toString(regularity I50));
print("  Number of generators (mingens) = " | toString(numgens J50));
print("  Degrees of generators (mingens) = " | toString(degrees J50));
print("  Minimal generators: " | toString J50);

--------------------------------------------------

-- ===== Graph 51 =====
-- Edges: [(0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 4), (1, 5), (2, 3), (2, 5), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (2, 3), (2, 5), (4, 5))

-- Create a polynomial ring for edges
R51 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11];

-- Create a polynomial ring for vertices
S51 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t4  (edge {1,4})
-- x4 -> t1*t5  (edge {1,5})
-- x5 -> t1*t6  (edge {1,6})
-- x6 -> t2*t3  (edge {2,3})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t4  (edge {3,4})
-- x10 -> t3*t6  (edge {3,6})
-- x11 -> t4*t5  (edge {4,5})

phi51 = map(S51, R51, {t1*t2, t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t5, t2*t6, t3*t4, t3*t6, t4*t5});

-- The toric ideal is the kernel of this map
I51 = kernel phi51;

J51 = ideal mingens I51;

-- Print results (using minimal generating set)
print("Graph 51: ");
print("  Regularity = " | toString(regularity I51));
print("  Number of generators (mingens) = " | toString(numgens J51));
print("  Degrees of generators (mingens) = " | toString(degrees J51));
print("  Minimal generators: " | toString J51);

--------------------------------------------------

-- ===== Graph 52 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 5), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 5), (2, 4), (2, 5), (3, 4), (3, 5))

-- Create a polynomial ring for edges
R52 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11];

-- Create a polynomial ring for vertices
S52 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t4  (edge {3,4})
-- x10 -> t3*t6  (edge {3,6})
-- x11 -> t4*t5  (edge {4,5})

phi52 = map(S52, R52, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t2*t6, t3*t4, t3*t6, t4*t5});

-- The toric ideal is the kernel of this map
I52 = kernel phi52;

J52 = ideal mingens I52;

-- Print results (using minimal generating set)
print("Graph 52: ");
print("  Regularity = " | toString(regularity I52));
print("  Number of generators (mingens) = " | toString(numgens J52));
print("  Degrees of generators (mingens) = " | toString(degrees J52));
print("  Minimal generators: " | toString J52);

--------------------------------------------------

-- ===== Graph 53 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4), (2, 3), (2, 5), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R53 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11];

-- Create a polynomial ring for vertices
S53 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t2*t6  (edge {2,6})
-- x8 -> t3*t4  (edge {3,4})
-- x9 -> t3*t5  (edge {3,5})
-- x10 -> t3*t6  (edge {3,6})
-- x11 -> t4*t5  (edge {4,5})

phi53 = map(S53, R53, {t1*t2, t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5, t3*t6, t4*t5});

-- The toric ideal is the kernel of this map
I53 = kernel phi53;

J53 = ideal mingens I53;

-- Print results (using minimal generating set)
print("Graph 53: ");
print("  Regularity = " | toString(regularity I53));
print("  Number of generators (mingens) = " | toString(numgens J53));
print("  Degrees of generators (mingens) = " | toString(degrees J53));
print("  Minimal generators: " | toString J53);

--------------------------------------------------

-- ===== Graph 54 =====
-- Edges: [(0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5), (3, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R54 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12];

-- Create a polynomial ring for vertices
S54 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t4  (edge {1,4})
-- x4 -> t1*t5  (edge {1,5})
-- x5 -> t1*t6  (edge {1,6})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t4  (edge {3,4})
-- x10 -> t3*t5  (edge {3,5})
-- x11 -> t3*t6  (edge {3,6})
-- x12 -> t4*t5  (edge {4,5})

phi54 = map(S54, R54, {t1*t2, t1*t3, t1*t4, t1*t5, t1*t6, t2*t4, t2*t5, t2*t6, t3*t4, t3*t5, t3*t6, t4*t5});

-- The toric ideal is the kernel of this map
I54 = kernel phi54;

J54 = ideal mingens I54;

-- Print results (using minimal generating set)
print("Graph 54: ");
print("  Regularity = " | toString(regularity I54));
print("  Number of generators (mingens) = " | toString(numgens J54));
print("  Degrees of generators (mingens) = " | toString(degrees J54));
print("  Minimal generators: " | toString J54);

--------------------------------------------------

-- ===== Graph 55 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 4), (2, 5), (3, 4), (3, 5)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 5), (2, 4), (2, 5), (3, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R55 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12];

-- Create a polynomial ring for vertices
S55 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t1*t6  (edge {1,6})
-- x5 -> t2*t3  (edge {2,3})
-- x6 -> t2*t4  (edge {2,4})
-- x7 -> t2*t5  (edge {2,5})
-- x8 -> t2*t6  (edge {2,6})
-- x9 -> t3*t5  (edge {3,5})
-- x10 -> t3*t6  (edge {3,6})
-- x11 -> t4*t5  (edge {4,5})
-- x12 -> t4*t6  (edge {4,6})

phi55 = map(S55, R55, {t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t2*t6, t3*t5, t3*t6, t4*t5, t4*t6});

-- The toric ideal is the kernel of this map
I55 = kernel phi55;

J55 = ideal mingens I55;

-- Print results (using minimal generating set)
print("Graph 55: ");
print("  Regularity = " | toString(regularity I55));
print("  Number of generators (mingens) = " | toString(numgens J55));
print("  Degrees of generators (mingens) = " | toString(degrees J55));
print("  Minimal generators: " | toString J55);

--------------------------------------------------

-- ===== Graph 56 =====
-- Edges: [(0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 4), (2, 5), (3, 4), (3, 5)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (3, 5), (4, 5))

-- Create a polynomial ring for edges
R56 = QQ[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13];

-- Create a polynomial ring for vertices
S56 = QQ[t1, t2, t3, t4, t5, t6];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t4  (edge {1,4})
-- x4 -> t1*t5  (edge {1,5})
-- x5 -> t1*t6  (edge {1,6})
-- x6 -> t2*t3  (edge {2,3})
-- x7 -> t2*t4  (edge {2,4})
-- x8 -> t2*t5  (edge {2,5})
-- x9 -> t2*t6  (edge {2,6})
-- x10 -> t3*t5  (edge {3,5})
-- x11 -> t3*t6  (edge {3,6})
-- x12 -> t4*t5  (edge {4,5})
-- x13 -> t4*t6  (edge {4,6})

phi56 = map(S56, R56, {t1*t2, t1*t3, t1*t4, t1*t5, t1*t6, t2*t3, t2*t4, t2*t5, t2*t6, t3*t5, t3*t6, t4*t5, t4*t6});

-- The toric ideal is the kernel of this map
I56 = kernel phi56;

J56 = ideal mingens I56;

-- Print results (using minimal generating set)
print("Graph 56: ");
print("  Regularity = " | toString(regularity I56));
print("  Number of generators (mingens) = " | toString(numgens J56));
print("  Degrees of generators (mingens) = " | toString(degrees J56));
print("  Minimal generators: " | toString J56);

--------------------------------------------------

