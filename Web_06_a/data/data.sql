 class Furniture {
    String id, name;
    int weight;
    Furniture() {}
    Furniture(String id, String name, int weight) {
        this.id = id; this.name = name; this.weight = weight;
    }
    @Override public String toString() { return "(" + id + ", " + name + ", " + weight + ")"; }
}

class Node {
    Furniture info;
    Node next;
    Node(Furniture x) { info = x; }
}

class FurnitureList {
    Node head, tail;

    FurnitureList() { head = tail = null; }

    boolean isEmpty() { return head == null; }

    void clear() { head = tail = null; }

    void loadDataFurniture(int k) //do not edit this function
    {
        String[] a = Lib.readLineToStrArray("data.txt", k);
        String[] b = Lib.readLineToStrArray("data.txt", k + 1);
        int[]    c = Lib.readLineToIntArray("data.txt", k + 2);
        int n = a.length;
        for (int i = 0; i < n; i++) {
            addLast(a[i], b[i], c[i]);
        }




    // ------------------- REQUIRED FUNCTIONS -------------------

    ---------addFirst-----------------------------------------------
    void addFirst(String id, String name, int weight) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        Furniture p = new Furniture(id, name, weight);
        Node node = new Node(p);
        if (isEmpty()) {
            head = tail = node;
        } else {
            node.next = head;
            head = node;
        }
        //--------------------------------------------------------
    }

    -- implement the 'addFirst' method that inserts a new Node
    --  * into the list's head if the price is less than 100.0 Note

     void addFirst(String xName, double xPrice, int xColor) {

        if (xPrice < 100.0) {
            Bike p = new Bike(xName, xPrice, xColor);
            Node node = new Node(p);

            if (isEmpty()) {
                head = tail = node;
            } else {
                node.next = head;
                head = node;
            }
            
            size++;
        }

    ---------removeFirst-----------------------------------------------
    void removeFirst() {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (isEmpty()) return;
        head = head.next;
        if (head == null) tail = null;
        //--------------------------------------------------------
    }
    
    


    ---------addLast-----------------------------------------------
    void addLast(String id, String name, int weight) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        Furniture p = new Furniture(id, name, weight);
        Node node = new Node(p);
        if (isEmpty()) {
            head = tail = node;
        } else {
            tail.next = node;
            tail = node;
        }
        //--------------------------------------------------------
    }

  


    ---------removeLast-----------------------------------------------
    void removeLast() {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (isEmpty()) return;
        if (head == tail) { head = tail = null; return; }
        Node cur = head;
        while (cur.next != tail) cur = cur.next;
        cur.next = null;
        tail = cur;
        //--------------------------------------------------------
    }
    
    Pre.next = null; -- removeLast
    tail = pre;
    

    void removeLast() {
        // List is empty
        if (isEmpty()) {
            return;
        }

        // Only one node
        if (head == tail) {
            head = tail = null;
            size = 0;
            return;
        }

        // At least 2 nodes: find node before tail
        Node current = head;
        while (current.next != tail) {
            current = current.next;
        }

        // current is second last
        current.next = null;
        tail = current;
        size--;
    }



    ---------addAfter-----------------------------------------------
    void addAfter(Node q, String id, String name, int weight) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (q == null) return;
        Furniture p = new Furniture(id, name, weight);
        Node node = new Node(p);
        node.next = q.next;
        q.next = node;
        if (tail == q) tail = node;
        //--------------------------------------------------------
    }
    ---------searchById-----------------------------------------------
    Node searchById(String id) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        Node cur = head;
        while (cur != null) {
            if (cur.info.id.equalsIgnoreCase(id)) return cur;
            cur = cur.next;
        }
        return null;
        //--------------------------------------------------------
    }
    
-----addAfter
add a node with value x after the node p
void addAfter(Node p, int x) {
        if (p == null) {
            return;
        }
        Node newNode = new Node(x);
        newNode.next = p.next;
        p.next = newNode;
    }

-------age > 4
add if age > 4
    public void addLastCondition(){
        Node p=head;
        while(p!=null){
            if(p.info.age>4) h.addLast(p.info);
            p=p.next;
        }
    }



    ---------removeById-----------------------------------------------
    void removeById(String id) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (isEmpty()) return;
        if (head.info.id.equalsIgnoreCase(id)) { removeFirst(); return; }
        Node cur = head;
        while (cur.next != null && !cur.next.info.id.equalsIgnoreCase(id)) cur = cur.next;
        if (cur.next == null) return;            // not found
        if (cur.next == tail) tail = cur;        // remove tail
        cur.next = cur.next.next;
        //--------------------------------------------------------
    }
    ---------size-----------------------------------------------
    int size() {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        int c = 0;
        Node cur = head;
        while (cur != null) { c++; cur = cur.next; }
        return c;
        //--------------------------------------------------------
    }

    ---------traverse-----------------------------------------------
    void traverse() {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        Node cur = head;
        while (cur != null) {
            System.out.print(cur.info + " ");
            cur = cur.next;
        }
        System.out.println();
        //--------------------------------------------------------
    }

    // Ví dụ PE: xóa phần tử đầu tiên có weight > w
    void removeFirstWeightGreaterThan(int w) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (isEmpty()) return;
        if (head.info.weight > w) { removeFirst(); return; }
        Node cur = head;
        while (cur.next != null && cur.next.info.weight <= w) cur = cur.next;
        if (cur.next == null) return;
        if (cur.next == tail) tail = cur;
        cur.next = cur.next.next;
        //--------------------------------------------------------
    }
}
----------------------------------------------------------------------------------------
-------------------------addFirst khong co dieu kien------------------------------------

void addFirst(String id, int weight) {
    Node newNode = new Node(new Furniture(id, weight));

    // nếu danh sách rỗng
    if (head == null) {
        head = tail = newNode;
        return;
    }

    // thêm vào đầu
    newNode.next = head;
    head = newNode;
}


--addFirst co dieu kien (ví dụ: chỉ thêm nếu weight > 0 và id khác null)------------------------------------

void addFirst(String id, int weight) {
    if (id == null || weight <= 0) return;  // điều kiện




    Node newNode = new Node(new Furniture(id, weight));

    if (head == null) {
        head = tail = newNode;
    } else {
        newNode.next = head;
        head = newNode;
    }
}

---------------------------------------------------------------------------------------
-------------------------addLast khong co dieu kien------------------------------------

void addLast(String id, int weight) {
    Node newNode = new Node(new Furniture(id, weight));

    if (head == null) {
        head = tail = newNode;
        return;
    }

    tail.next = newNode;
    tail = newNode;
}



--addLast co dieu kien (ví dụ: không thêm nếu id null hoặc bắt đầu bằng 'A')------------------------------------

void addLast(String id, int weight) {
    if (id == null || id.charAt(0) == 'A') return; // điều kiện ràng buộc

    Node newNode = new Node(new Furniture(id, weight));

    if (head == null) {
        head = tail = newNode;
    } else {
        tail.next = newNode;
        tail = newNode;
    }
}

-- adng co dieu kien check xDriver.charAt(0) == 'A'
    void addLast(String xDriver, int xRate, int xColor) {

        if (xDriver.charAt(0) == 'A') {
            return;
        }
        Canoe p = new Canoe(xDriver, xRate, xColor);
        Node node = new Node(p);

        if (head == null) {
            head = tail = node;
        } else {
            tail.next = node;
            tail = node;

        }
    }

---------------------------------------------------------------------------------------
-------------------------removeFirst khong co dieu kien------------------------------------

void removeFirst() {
    if (head == null) return;  // kiểm tra rỗng

    head = head.next;

    if (head == null)  // nếu sau khi xóa danh sách trống
        tail = null;
}


--removeFirst khong co dieu kien (ví dụ: chỉ xóa nếu phần tử đầu có weight > 50)

void removeFirst() {
    if (head == null) return; // rỗng thì không làm gì

    if (head.info.getWeight() <= 50) return; // điều kiện không xóa

    head = head.next;

    if (head == null)
        tail = null;
}

---------------------------------------------------------------------------------------
-------------------------removeLast khong co dieu kien------------------------------------

void removeLast() {
    if (head == null) return;       // rỗng
    if (head == tail) {             // chỉ 1 phần tử
        head = tail = null;
        return;
    }

    Node cur = head;
    while (cur.next != tail) {      // tìm node kế cuối
        cur = cur.next;
    }

    cur.next = null;
    tail = cur;
}


---removeLast co dieu kien(ví dụ: chỉ xóa nếu phần tử cuối có weight < 100)

void removeLast() {
    if (head == null) return;

    if (head == tail) {
        if (head.info.getWeight() < 100) // điều kiện
            head = tail = null;
        return;
    }

    Node cur = head;
    while (cur.next != tail) {
        cur = cur.next;
    }

    // điều kiện kiểm tra phần tử cuối
    if (tail.info.getWeight() < 100) {
        tail = cur;
        tail.next = null;
    }
}





-------------------------STACK - PUSH - POP------------------------------------

class TruckStack {
    Node top;

    TruckStack() { top = null; }

    boolean isEmpty() { return top == null; }

    void clear() { top = null; }

    void loadDataTruck(int k) //do not edit this function
    {
        String[] a = Lib.readLineToStrArray("data.txt", k + 3);
        int[]    b = Lib.readLineToIntArray("data.txt", k + 4);
        int n = a.length;
        for (int i = 0; i < n; i++) {
            push(a[i], b[i]);
        }



     -----------push---------------------------------------------
    void push(String id, int weight) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------

        Furniture p = new Furniture(id, weight);
        Node node = new Node(p);

        node.next = top;
        top = node;

        //---------------------------------------------------------
    }
    
    -----------pop---------------------------------------------
    Furniture pop() {
        Furniture tmp = new Furniture();
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------

        Furniture pop() { --dang 1
        if (isEmpty()) {
            return null; // kiểm tra trước khi truy cập top
        }

        Furniture removed = top.info;
        top = top.next;
        return removed;
        }

        -----------------------------------------

        ----- dang 2 cua pop
        tmp = top.info; 
        if (isEmpty()) {
            return null;
        }

        Furniture removed = top.info;
        top = top.next;

        //---------------------------------------------------------
        return tmp;
    }

    ---- dang 3 pop
    public StoreAction pop() {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------

        if (isEmpty()) {
            return null;
        }

        StoreAction removed = top.info;
        top = top.next;
    
    
    Furniture peek() {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        return isEmpty() ? null : top.info;
        //--------------------------------------------------------
    }
}
 
    ------------------- push - pop khong co dieu kien -------------------

class Truck {

    Node head;

    Truck() {
        head = null;
    }

    boolean isEmpty() {
        return (head == null);
    }

    void clear() {
        head = null;
    }

    void loadTruck(int k) //do not edit this function
    {
        String[] a = Lib.readLineToStrArray("data.txt", k + 4);
        int[] b = Lib.readLineToIntArray("data.txt", k + 5);
        int[] c = Lib.readLineToIntArray("data.txt", k + 6);
        int[] d = Lib.readLineToIntArray("data.txt", k + 7);
        int n = a.length;
        for (int i = 0; i < n; i++) {
            push(a[i], b[i], c[i], d[i]);
        }
    }

    void push(String name, int weight, int length, int fragile) {
        
        Item x = new Item(name, weight, length, fragile);
        Node p = new Node(x);
        
        p.next = head;
        head = p;
        
        //----------------------------------------------------------------------
    }

        Node pop() {
        if (isEmpty()) {
            return null;
        }
        Node temp = head;
        head = head.next;
        temp.next = null; // detach node completely
        return temp;
    }

void push(int x) {
    Node n = new Node(x);
    n.next = top;
    top = n;
}

void push(Node q) {
    if (q == null) return;
    q.next = head;
    head = q;
}

int pop() {
    if (top == null) {
        System.out.println("Stack empty");
        return -1;
    }
    int val = top.info;
    top = top.next;
    return val;
}

       ------------------- push - pop co dieu kien -------------------
void push(int x) {
    if (x < 0) return; // điều kiện không cho số âm
    Node n = new Node(x);
    n.next = top;
    top = n;
}

int pop() {
    if (top == null) return -1;  // nếu rỗng thì không pop
    int val = top.info;
    top = top.next;
    return val;
}


    ------------------- enqueue - dequeue -------------------

class RequestQueue {
    Node head, tail;

    RequestQueue() { head = tail = null; }

    boolean isEmpty() { return head == null; }

    void clear() { head = tail = null; }

    void enQueue(String type, int amount) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        
        Fruit p = new Fruit(type, amount);
        Node node = new Node(p);
        
        if(isEmpty()){
            front = rear = node;
        }else{
            rear.next = node;
            rear = node;
        }
     
        //---------------------------------------------------------
    }

   Fruit deQueue() {
        Fruit tmp = new Fruit();
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if(isEmpty()){
            return null;
        }
        tmp = front.info;
        front = front.next;
        if(front == null){
            rear = null;
        }
        
        //---------------------------------------------------------
        return tmp;
    }

}

    Furniture front() {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        return isEmpty() ? null : head.info;
        //--------------------------------------------------------
    }
}


    ------ enqueue - dequeue khong co dieu kien

    void enqueue(int x) {
    Node n = new Node(x);
    if (rear == null) {       // hàng trống
        front = rear = n;
        return;
    }
    rear.next = n;
    rear = n;
}

int dequeue() {
    if (front == null) {      // rỗng
        System.out.println("Empty queue");
        return -1;
    }
    int val = front.info;
    front = front.next;
    if (front == null) rear = null;
    return val;
}

    ------ enqueue - dequeue co dieu kien

void enqueue(int x) {
    if (x < 0) return;   // điều kiện
    Node n = new Node(x);
    if (rear == null) {
        front = rear = n;
        return;
    }
    rear.next = n;
    rear = n;
}

int dequeue() {
    if (front == null) return -1; // điều kiện: hàng rỗng thì dừng
    int val = front.info;
    front = front.next;
    if (front == null) rear = null;
    return val;
}




----------------------------------------------------------------------------

class TreeNode {
    Furniture info;
    TreeNode left, right;
    TreeNode(Furniture x) { info = x; }
}

class BSTree {
    TreeNode root;

    BSTree() { root = null; }

    boolean isEmpty() { return root == null; }

    void clear() { root = null; }

    // ------- IO helpers thường có trong đề -------
    void visit(TreeNode p) {
        if (p != null) System.out.print(p.info + " ");
    }

    void fvisit(TreeNode p, RandomAccessFile f) throws Exception {
        if (p != null) f.writeBytes(p.info + " ");
    }

    void breadth(TreeNode p, RandomAccessFile f) throws Exception {
        if (p == null) return;
        Queue<TreeNode> q = new java.util.LinkedList<>();
        q.add(p);
        while (!q.isEmpty()) {
            TreeNode r = q.poll();
            fvisit(r, f);
            if (r.left != null) q.add(r.left);
            if (r.right != null) q.add(r.right);
        }
    }

    // ------------------- INSERT BST -------------------




    
    
    ---- insert vao cay dang 1-------

    void insert(String id, String name, double gpa, String major, double balance) {

        Student s = new Student(id, name, gpa, major, balance);

        if (root == null) {
            root = new TreeNode(s);
            return;
        }

        TreeNode cur = root, parent = null;
        while (cur != null) {
            parent = cur;
            int cmp = id.compareTo(cur.info.getId());
            if (cmp == 0) {
                cur.info.setName(name);
                cur.info.setGpa(gpa);
                cur.info.setMajor(major);
                cur.info.setBalance(balance);
                return;
            } else if (cmp < 0) {
                cur = cur.left;
            } else {
                cur = cur.right;
            }

        }

        if (id.compareTo(parent.info.getId()) < 0) {
            parent.left = new TreeNode(s);
        } else {
            parent.right = new TreeNode(s);
        }

        // --------------------------------------------------------
    }

    ---- insert vao cay dang 2 recursive -------
    
    TreeNode insert(TreeNode root, Student s) {
    // Nếu cây đang rỗng → tạo node mới
    if (root == null) {
        return new TreeNode(s);
    }

    // So sánh khóa (ID sinh viên)
    if (s.getId().compareTo(root.info.getId()) < 0) {
        root.left = insert(root.left, s);   // chèn bên trái
    } else if (s.getId().compareTo(root.info.getId()) > 0) {
        root.right = insert(root.right, s); // chèn bên phải
    } else {
        // Nếu ID đã tồn tại → cập nhật thông tin
        root.info = s;
    }

    return root; // trả lại gốc
}

    ---- insert vao cay dang 3 iterative -------
        
void insert(String id, String name, double gpa, String major, double balance) {
    Student s = new Student(id, name, gpa, major, balance);
    TreeNode newNode = new TreeNode(s);

    if (root == null) {
        root = newNode;
        return;
    }

    TreeNode parent = null;
    TreeNode current = root;

    while (current != null) {
        parent = current;
        int cmp = id.compareTo(current.info.getId());

        if (cmp < 0) {
            current = current.left;
        } else if (cmp > 0) {
            current = current.right;
        } else {
            // update nếu ID trùng
            current.info = s;
            return;
        }
    }

    // gắn node mới vào trái hoặc phải
    if (id.compareTo(parent.info.getId()) < 0) {
        parent.left = newNode;
    } else {
        parent.right = newNode;
    }
}


    --------- insert ket hop hai buoc (neu GPA < 2.0 thi ko chen hoac chen co dieu kien------------
    
// Helper insert trả về node mới
TreeNode insertNode(TreeNode root, Student s) {
    if (root == null) return new TreeNode(s);

    int cmp = s.getId().compareTo(root.info.getId());
    if (cmp < 0) root.left = insertNode(root.left, s);
    else if (cmp > 0) root.right = insertNode(root.right, s);
    else root.info = s;

    return root;
}

// Hàm chính gọi helper
void insert(String id, String name, double gpa, String major, double balance) {
    // Ví dụ thêm điều kiện: chỉ chèn nếu GPA >= 2.0
    if (gpa < 2.0) return;

    Student s = new Student(id, name, gpa, major, balance);
    root = insertNode(root, s);
}



    --------- insert ket hop hai buoc (neu GPA >= 3.0 chen co dieu kien------------

    void insert(String id, String name, double gpa, String major, double balance) {
    // Điều kiện lọc
    if (gpa < 3.0) return;  

    Student s = new Student(id, name, gpa, major, balance);
    root = insertNode(root, s); // gọi hàm đệ quy helper
}

    TreeNode insertNode(TreeNode root, Student s) {
    if (root == null) return new TreeNode(s);

    int cmp = s.getId().compareTo(root.info.getId());
    if (cmp < 0) root.left = insertNode(root.left, s);
    else if (cmp > 0) root.right = insertNode(root.right, s);
    else root.info = s; // update nếu trùng ID

    return root;
}

    ------- insert (khong chen ID neu bat dau bang chu X)-------

    void insert(String id, String name, double gpa, String major, double balance) {
    if (id.startsWith("X")) return; // bỏ qua ID tạm

    Student s = new Student(id, name, gpa, major, balance);
    root = insertNode(root, s);
}


    ------ insert ( Tự động cộng thêm tiền thưởng nếu major = "CS") -----
    
void insert(String id, String name, double gpa, String major, double balance) {
    // Tự cộng thưởng cho CS
    if (major.equalsIgnoreCase("CS")) {
        balance += 100;
    }

    Student s = new Student(id, name, gpa, major, balance);
    root = insertNode(root, s);
}


    ------ insert (neu sinh vien da ton tai thi cap nhat thong tin moi)

    TreeNode insertNode(TreeNode root, Student s) {
    if (root == null) return new TreeNode(s);

    int cmp = s.getId().compareTo(root.info.getId());
    if (cmp < 0) root.left = insertNode(root.left, s);
    else if (cmp > 0) root.right = insertNode(root.right, s);
    else {
        // cập nhật dữ liệu
        root.info.setName(s.getName());
        root.info.setGpa(s.getGpa());
        root.info.setMajor(s.getMajor());
        root.info.setBalance(s.getBalance());
    }
    return root;
}



    --------insert (chen co dieu kien kep - vua theo GPA va vua theo Major)


    void insert(String id, String name, double gpa, String major, double balance) {
    if ((major.equalsIgnoreCase("CS") || major.equalsIgnoreCase("IT")) && gpa >= 3.5) {
        Student s = new Student(id, name, gpa, major, balance);
        root = insertNode(root, s);
    }
}




    --------insert khong co dieu kien------
    
    void insert(String xName, double xPrice, int xColor) {
    Bike x = new Bike(xName, xPrice, xColor);
    Node newNode = new Node(x);

    if (root == null) {
        root = newNode;
        return;
    }

    Node cur = root, parent = null;
    while (cur != null) {
        parent = cur;
        if (xName.compareTo(cur.info.getName()) < 0)
            cur = cur.left;
        else
            cur = cur.right;
    }

    if (xName.compareTo(parent.info.getName()) < 0)
        parent.left = newNode;
    else
        parent.right = newNode;
}


    ------ insert co dieu kien (vd: neu color <20)------
    void insert(String xName, double xPrice, int xColor) {
        // chỉ insert nếu color < 20
        if (xColor >= 20) {
            return;
        }

        Bike b = new Bike(xName, xPrice, xColor);
        Node newNode = new Node(b);

        // cây đang rỗng
        if (root == null) {
            root = newNode;
            return;
        }

        Node cur = root;
        Node parent = null;

        while (cur != null) {
            parent = cur;
            int cmp = xName.compareTo(cur.getInfo().getName());

            if (cmp == 0) {
                // không cho trùng key -> bỏ qua
                return;
            } else if (cmp < 0) {
                cur = cur.left;
            } else {
                cur = cur.right;
            }
        }

        // gắn node mới vào trái / phải của parent theo key
        if (xName.compareTo(parent.getInfo().getName()) < 0) {
            parent.left = newNode;
        } else {
            parent.right = newNode;
        }
    }



    

    

        private TreeNode insert(TreeNode root, Order order) {

        //--------------------------------------------------------

        if (root == null) {
            return new TreeNode(order);
        }

        int cmp = order.getID().compareToIgnoreCase(root.info.getID());

        if (cmp < 0) {                 // sang trái
            root.left = insert(root.left, order);
        } else if (cmp > 0) {          // sang phải
            root.right = insert(root.right, order);
        }
        // cmp == 0: trùng ID -> bỏ qua

        return root;
    }

    TreeNode search(String id) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        TreeNode p = root;
        while (p != null) {
            int c = id.compareToIgnoreCase(p.info.id);
            if (c == 0) return p;
            p = (c < 0) ? p.left : p.right;
        }
        return null;
        //--------------------------------------------------------
    }

    void inOrder(TreeNode p) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (p == null) return;
        inOrder(p.left);
        visit(p);
        inOrder(p.right);
        //--------------------------------------------------------
    }

    void preOrder(TreeNode p) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (p == null) return;
        visit(p);
        preOrder(p.left);
        preOrder(p.right);
        //--------------------------------------------------------
    }

    void postOrder(TreeNode p) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (p == null) return;
        postOrder(p.left);
        postOrder(p.right);
        visit(p);
        //--------------------------------------------------------
    }

    TreeNode findMin(TreeNode p) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (p == null) return null;
        while (p.left != null) p = p.left;
        return p;
        //--------------------------------------------------------
    }

    TreeNode findMax(TreeNode p) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (p == null) return null;
        while (p.right != null) p = p.right;
        return p;
        //--------------------------------------------------------
    }

    int count(TreeNode p) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (p == null) return 0;
        return 1 + count(p.left) + count(p.right);
        //--------------------------------------------------------
    }

    int height(TreeNode p) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (p == null) return -1; // hoặc 0 tùy đề; PE FPT hay dùng -1
        int lh = height(p.left), rh = height(p.right);
        return 1 + Math.max(lh, rh);
        //--------------------------------------------------------
    }

    TreeNode remove(TreeNode p, String id) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (p == null) return null;
        int c = id.compareToIgnoreCase(p.info.id);
        if (c < 0) p.left  = remove(p.left,  id);
        else if (c > 0) p.right = remove(p.right, id);
        else {
            if (p.left == null)  return p.right;
            if (p.right == null) return p.left;
            TreeNode succ = findMin(p.right);     // kế nhiệm trái nhất của nhánh phải
            p.info = succ.info;                   // copy info
            p.right = remove(p.right, succ.info.id); // xóa node kế nhiệm
        }
        return p;
        //--------------------------------------------------------
    }
}

    void updateNode() {
        Node p = head;
        while (p != null) {
            Bike b = p.getInfo();
            double price = b.getPrice();
            int color = b.getColor();

            if (price < 20.5) {
                b.setColor(color + 1);
            } else if (price <= 40.5) {
                b.setColor(color + 2);
            } else { // price > 40.5
                b.setColor(color + 3);
            }

            p = p.next;
        }
    }




class RequestQueue {

    Node front, rear;

    RequestQueue() {
        front = rear = null;
    }

    boolean isEmpty() {
        return (front == null);
    }

    void clear() {
        front = rear = null;
    }

    void loadDataRequest(int k) //do not edit this function
    {
        String[] a = Lib.readLineToStrArray("data.txt", k + 3);
        int[] b = Lib.readLineToIntArray("data.txt", k + 4);
        int n = a.length;
        for (int i = 0; i < n; i++) {
            enQueue(a[i], b[i]);
        }
    }


    void enQueue(String type, int amount) {
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------

        Fruit newFruit = new Fruit(type, amount);
        Node newNode = new Node(newFruit, null);
        if (isEmpty()) {
            front = rear = newNode;
        } else {
            rear.next = newNode;
            rear = rear.next;
        }
        size();
        //---------------------------------------------------------
    }

    Fruit deQueue() {
        Fruit tmp = new Fruit();
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if (isEmpty()) {
            return null;
        }
        tmp = front.info;
        front = front.next;
        if (front == null) {
            rear = null;
        }
        //---------------------------------------------------------
        return tmp;
    }



    void f2() throws Exception {
        load(1);
        String fname = "f2.txt";
        File g123 = new File(fname);
        if (g123.exists()) {
            g123.delete();
        }
        RandomAccessFile f = new RandomAccessFile(fname, "rw");
        ftraverse(f);
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
 Fruit request = RQueue.deQueue();
        Node p = FList.head;
        while (p != null) {
            if (p.info.getType().equalsIgnoreCase(request.getType())) {
                if (p.info.getAmount() >= request.getAmount()) {
                    p.info.setAmount(p.info.getAmount() - request.getAmount());
                }
                break;
            }
            p = p.next;
        }        //---------------------------------------------------------
        ftraverse(f);
        f.close();
    }


// Enqueue // Add an object to the queue
    public void enqueue(T obj) {
        Node newNode = new Node(obj);
        if (rear == null) {
            front = rear = newNode;
        } else {
            rear.next = newNode;
            rear = newNode;
        }
    }

// Dequeue // Remove an object from the queue
    public T dequeue() {
        if (isEmpty()) {
            return null;
        }
        T data = front.info;
        front = front.next;
        if (front == null) {
            rear = null;
        }
        return data;
    }


// Push // Add an object to the stack
    public void push(T obj) {
        Node newNode = new Node(obj);
        if (top == null) {
            top = newNode;
        } else {
            newNode.next = top;
            top = newNode;
        }
    }

// Pop // Remove and return the top object from the stack
    public T pop() {
        if (isEmpty()) {
            return null;
        }
        T data = top.info;
        top = top.next;
        return data;
    }

// Peek // View the top object in the stack without removing it
    public T peek() {
        if (isEmpty()) {
            return null;
        }
        return top.info;
    }

// IsEmpty // Check if the stack is empty
    public boolean isEmpty() {
        return top == null;
    }

// Clear // Clear all elements in the stack
    public void clear() {
        top = null;
    }

// Size // Get the number of elements in the stack
    public int size() {
        int count = 0;
        Node current = top;
        while (current != null) {
            count++;
            current = current.next;
        }
        return count;
    }

// Display // Display all objects in the stack
    public void display() {
        Node current = top;
        while (current != null) {
            System.out.println(current.info); // Assuming the object has a toString() method
            current = current.next;
        }
    }

// Get Node At // Get the Node at index x in the stack
    public Node getNodeAt(int index) {
        if (index < 0 || index >= size()) {
            return null; // Return null if the index is invalid
        }
        Node current = top;
        int count = 0;
        while (current != null) {
            if (count == index) {
                return current; // Return the Node at the given index
            }
            count++;
            current = current.next;
        }
        return null;
    }

// Find By A // Find a Node with an object that has attribute A = x
    public Node findByA(String attribute) {
        Node current = top;
        while (current != null) {
            if (current.info.A.equals(attribute)) { // Use toString() to compare the attribute
                return current; // Return the Node if a match is found
            }
            current = current.next;
        }
        return null; // Return null if no match is found
    }

// Swap two nodes based on their index
public void swap(int index1, int index2) {
    if (index1 == index2 || index1 < 0 || index2 < 0 || index1 >= size() || index2 >= size()) {
        return; // Do nothing if indices are invalid or the same
    }

    Node node1 = getNodeAt(index1);
    Node node2 = getNodeAt(index2);

    if (node1 != null && node2 != null) {
        T temp = node1.info;
        node1.info = node2.info;
        node2.info = temp;
    }
}

// Find the first node with attribute A = x
public Node findFirstByA(String attribute) {
    Node current = top;
    while (current != null) {
        if (current.info.A.equals(attribute)) {
            return current; // Return the first matching node
        }
        current = current.next;
    }
    return null; // Return null if no match is found
}

// Find the second node with attribute A = x
public Node findSecondByA(String attribute) {
    Node current = top;
    int count = 0;

    while (current != null) {
        if (current.info.A.equals(attribute)) {
            count++;
            if (count == 2) {
                return current; // Return the second matching node
            }
        }
        current = current.next;
    }
    return null; // Return null if second match is not found
}

// Find the object with the minimum value of attribute A
public T findMinByA() {
    if (isEmpty()) {
        return null;
    }
    Node current = top;
    T min = current.info;

    while (current != null) {
        if (((Comparable<String>) current.info.A).compareTo(min.A) < 0) { // Assuming A is a String, modify if A is a different type
            min = current.info;
        }
        current = current.next;
    }
    return min;
}

// Find the object with the maximum value of attribute A
public T findMaxByA() {
    if (isEmpty()) {
        return null;
    }
    Node current = top;
    T max = current.info;

    while (current != null) {
        if (((Comparable<String>) current.info.A).compareTo(max.A) > 0) { // Assuming A is a String, modify if A is a different type
            max = current.info;
        }
        current = current.next;
    }
    return max;
}


    void printInsertionOrder(RandomAccessFile f) throws Exception {
        //You should insert here statements to complete this function
        //------------------------------------------------------------------
        SllNode p = head;
        int printed = 0;
        
        while(p != null && printed <5){
            if(p.info.isFee()){
                f.writeBytes("(" + p.info.getId() + "," 
                        + p.info.getName() + "," + p.info.isFee() + ") ");
                printed++;
            }
            p = p.next;
        }
        
        f.writeBytes("\r\n");
        f.close();
       
        
        
        //------------------------------------------------------------------
    }

    void display(RandomAccessFile f) throws Exception {
        SllNode p = head;
        while (p != null) {
            f.writeBytes("(" + p.info.getId() + "," 
                        + p.info.getName() + "," + p.info.isFee() + ") ");
            p = p.next;       
        }
        f.writeBytes("\r\n");
        f.close();
    }
}



    -------- dem so luong sinh vien bang 3
    BstNode insertStudent(BstNode root, Student std) {
        //You should insert here statements to complete this function
        //------------------------------------------------------------------
        
        if(root == null){
            return new BstNode(std);
        }
        
        if(std.getId() < root.info.getId()){
            root.left = insertStudent(root.left, std);
        }else if (std.getId() > root.info.getId()){
            root.right = insertStudent(root.right, std);
            
        }

        //------------------------------------------------------------------
        return root;
    }
    
    void insert(int xID, String xName, boolean xFee) {
        //You should insert here statements to complete this function
        //---------------------------------------------------------------------
        
        
        
        this.root = insertStudent(this.root, new Student(xID,xName,xFee));   			
	


        //---------------------------------------------------------------------       
    }
    
    int count(BstNode node) {    
        //You should insert here statements to complete this function
        //------------------------------------------------------------------
        
       if(node == null) return 0;
       int c = count(node.left) + count(node.right);
       if(!node.info.isFee()) c++;

        
       ------------------------------------------------------------------
        return c;
    }

------------------------------------------------------------------------------
public class HistoryStack {
    private class HistoryNode {
        WebPage page; HistoryNode next;
        HistoryNode(WebPage p) { this.page = p; this.next = null; }
    }
    private HistoryNode top;
    public HistoryStack() { this.top = null; }

    public WebPage pop() {
        if (isEmpty()) return null;
        HistoryNode temp = top;
        top = top.next;
        return temp.page;
    }
    
    public void ftraverse(RandomAccessFile f) throws Exception {
        f.writeBytes("  History:\r\n");
        if(isEmpty()){
            f.writeBytes("    [No History]\r\n");
            return;
        }
        HistoryNode current = top;
        while(current != null) {
            f.writeBytes("    - " + current.page.toString() + "\r\n");
            current = current.next;
        }
    }

    -- =======================================================
    -- === f1: STUDENT IMPLEMENTS THESE METHODS            ===
    -- =======================================================
    public boolean isEmpty() {
        // ---------- Student's code starts from here ----------
        
        return top == null;
        
        // ----------------------------------------------------
    }

    public void push(WebPage page) {
        // ---------- Student's code starts from here ----------
        
        HistoryNode newNode = new HistoryNode(page);
        newNode.next = top;
        top = newNode;
        
       
        
        return;
        // -----------------------------------------------------
    }
    
}

-- ====================== DẠNG 1: STACK (NGĂN XẾP) ======================
class Stack {
    Node top;

    Stack() {
        top = null;
    }

    boolean isEmpty() {
        -- Hàm kiểm tra xem stack có rỗng không
        -- Nếu top == null nghĩa là không có phần tử nào
        return top == null;
    }

    void push(int x) {
        -- Thêm phần tử vào đỉnh stack
        Node newNode = new Node(x);
        newNode.next = top;
        top = newNode;
    }

    int pop() {
        -- Lấy phần tử ra khỏi đỉnh stack
        if (isEmpty()) {
            System.out.println("Stack rong");
            return -1;
        }
        int val = top.data;
        top = top.next;
        return val;
    }
}

class Node {
    int data;
    Node next;

    Node(int d) {
        data = d;
        next = null;
    }
}

-- ====================== DẠNG 2: QUEUE (HÀNG ĐỢI) ======================
class Queue {
    Node front, rear;

    Queue() {
        front = rear = null;
    }

    boolean isEmpty() {
        -- Hàng đợi rỗng khi không có phần tử đầu (front == null)
        return front == null;
    }

    void enqueue(int x) {
        -- Thêm phần tử vào cuối hàng đợi
        Node newNode = new Node(x);
        if (isEmpty()) {
            front = rear = newNode;
        } else {
            rear.next = newNode;
            rear = newNode;
        }
    }

    int dequeue() {
        -- Lấy phần tử ở đầu hàng đợi ra
        if (isEmpty()) {
            System.out.println("Queue rong");
            return -1;
        }
        int val = front.data;
        front = front.next;
        if (front == null) rear = null;
        return val;
    }
}

-- ====================== DẠNG 3: SINGLY LINKED LIST ======================
class SinglyLinkedList {
    Node head, tail;

    SinglyLinkedList() {
        head = tail = null;
    }

    boolean isEmpty() {
        -- Danh sách liên kết đơn rỗng khi head == null
        return head == null;
    }

    void addFirst(int x) {
        -- Thêm phần tử vào đầu danh sách
        Node newNode = new Node(x);
        if (isEmpty()) {
            head = tail = newNode;
        } else {
            newNode.next = head;
            head = newNode;
        }
    }

    void addLast(int x) {
        -- Thêm phần tử vào cuối danh sách
        Node newNode = new Node(x);
        if (isEmpty()) {
            head = tail = newNode;
        } else {
            tail.next = newNode;
            tail = newNode;
        }
    }

    void traverse() {
        -- Duyệt danh sách và in ra
        Node p = head;
        while (p != null) {
            System.out.print(p.data + " ");
            p = p.next;
        }
        System.out.println();
    }
}

-- ====================== DẠNG 4: DOUBLE LINKED LIST ======================
class DoubleLinkedList {
    DNode head, tail;

    DoubleLinkedList() {
        head = tail = null;
    }

    boolean isEmpty() {
        -- Danh sách liên kết đôi rỗng khi cả head và tail đều null
        return head == null && tail == null;
    }

    void addFirst(int x) {
        -- Thêm phần tử vào đầu danh sách đôi
        DNode newNode = new DNode(x);
        if (isEmpty()) {
            head = tail = newNode;
        } else {
            newNode.next = head;
            head.prev = newNode;
            head = newNode;
        }
    }

    void addLast(int x) {
        -- Thêm phần tử vào cuối danh sách đôi
        DNode newNode = new DNode(x);
        if (isEmpty()) {
            head = tail = newNode;
        } else {
            tail.next = newNode;
            newNode.prev = tail;
            tail = newNode;
        }
    }

    void removeFirst() {
        -- Xóa phần tử đầu tiên trong danh sách đôi
        if (isEmpty()) return;
        if (head == tail) {
            head = tail = null;
        } else {
            head = head.next;
            head.prev = null;
        }
    }

    void removeLast() {
        -- Xóa phần tử cuối trong danh sách đôi
        if (isEmpty()) return;
        if (head == tail) {
            head = tail = null;
        } else {
            tail = tail.prev;
            tail.next = null;
        }
    }

    void traverseForward() {
        -- Duyệt xuôi từ đầu đến cuối
        DNode p = head;
        while (p != null) {
            System.out.print(p.data + " ");
            p = p.next;
        }
        System.out.println();
    }

    void traverseBackward() {
        -- Duyệt ngược từ cuối lên đầu
        DNode p = tail;
        while (p != null) {
            System.out.print(p.data + " ");
            p = p.prev;
        }
        System.out.println();
    }
}

class DNode {
    int data;
    DNode prev, next;

    DNode(int d) {
        data = d;
        prev = next = null;
    }
}




