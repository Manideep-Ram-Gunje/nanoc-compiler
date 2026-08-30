int x, y = 10;
int arr[5];

int add(int a, int b) {
    return a + b;
}

start:
x = 5;

x += y;
x = x << 2;

x = (x > y) ? x : y;

if (x < y) {
    x = x + y;
} else {
    x = x - 1;
}

while (x > 0) {
    x--;
}

do {
    x--;
} while (x > 0);

arr[2] = x;

case 1:
    x = 1;
default:
    x = 0;

x = add(x, y);

return x;