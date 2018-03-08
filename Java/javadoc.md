## Keyword
`javadoc`

## Reference
- [Documenting Exceptions with @throws Tag](http://www.oracle.com/technetwork/java/javase/documentation/index-137868.html#throwstag)
- [javapractices - Avoid @throws in javadoc](http://www.javapractices.com/topic/TopicAction.do?Id=171)

## 상황 / 궁금증
- Intellij의 Inspection code를 실행하니, javadoc 체크 부분에서 `'throws'tag description is missing `메시지가 출력되었다. description을 어떻게 쓸지 전혀 감이 안와서 정리.
- [궁금] 지금 코드에는 예외처리를 할떄, 거의 대부분의 경우에 `Exception` 만을 사용한다. try-catch해서 log를 남기는걸 목적으로 하는데 과연 이걸 예외처리라고 할 수 있을까? description 이 안되는건, 너무 넓은 범위의 exception을 써서 그런듯.
- [궁금]관련 내용을 기술할때 @see tag 가 매우 유용해보인다. 1method 1role 을 지키기 위해서 method 를 분리할 경우, @see tag 써서 어디서 호출되는지 기술해두는게 나을까? 아녀, 그건 너무 sticky한거 같다. 코드를 바꾼다면 나중에 죽은 주석이 될 가능성이 높을 거 같다. 지금 생각나는 적절한 상황은 interface를 구현했을때 해당 클래스에 `@see #구현한interface`로 구현한 인터페이스 정보를 @see로 적어두는거?

## 정리
### 어떻게 써야할까? 
- [Examples of Doc Comments](http://www.oracle.com/technetwork/java/javase/documentation/index-137868.html#examples)
```
Examples of Doc Comments
/**
 * Graphics is the abstract base class for all graphics contexts
 * which allow an application to draw onto components realized on
 * various devices or onto off-screen images.
 * A Graphics object encapsulates the state information needed
 * for the various rendering operations that Java supports.  This
 * state information includes:
 * <ul>
 * <li>The Component to draw on
 * <li>A translation origin for rendering and clipping coordinates
 * <li>The current clip
 * <li>The current color
 * <li>The current font
 * <li>The current logical pixel operation function (XOR or Paint)
 * <li>The current XOR alternation color
 *     (see <a href="#setXORMode">setXORMode</a>)
 * </ul>
 * <p>
 * Coordinates are infinitely thin and lie between the pixels of the
 * output device.
 * Operations which draw the outline of a figure operate by traversing
 * along the infinitely thin path with a pixel-sized pen that hangs
 * down and to the right of the anchor point on the path.
 * Operations which fill a figure operate by filling the interior
 * of the infinitely thin path.
 * Operations which render horizontal text render the ascending
 * portion of the characters entirely above the baseline coordinate.
 * <p>
 * Some important points to consider are that drawing a figure that
 * covers a given rectangle will occupy one extra row of pixels on
 * the right and bottom edges compared to filling a figure that is
 * bounded by that same rectangle.
 * Also, drawing a horizontal line along the same y coordinate as
 * the baseline of a line of text will draw the line entirely below
 * the text except for any descenders.
 * Both of these properties are due to the pen hanging down and to
 * the right from the path that it traverses.
 * <p>
 * All coordinates which appear as arguments to the methods of this
 * Graphics object are considered relative to the translation origin
 * of this Graphics object prior to the invocation of the method.
 * All rendering operations modify only pixels which lie within the
 * area bounded by both the current clip of the graphics context
 * and the extents of the Component used to create the Graphics object.
 * 
 * @author      Sami Shaio
 * @author      Arthur van Hoff
 * @version     %I%, %G%
 * @since       1.0
 */
public abstract class Graphics {

    /** 
     * Draws as much of the specified image as is currently available
     * with its northwest corner at the specified coordinate (x, y).
     * This method will return immediately in all cases, even if the
     * entire image has not yet been scaled, dithered and converted
     * for the current output device.
     * <p>
     * If the current output representation is not yet complete then
     * the method will return false and the indicated 
     * {@link ImageObserver} object will be notified as the
     * conversion process progresses.
     *
     * @param img       the image to be drawn
     * @param x         the x-coordinate of the northwest corner
     *                  of the destination rectangle in pixels
     * @param y         the y-coordinate of the northwest corner
     *                  of the destination rectangle in pixels
     * @param observer  the image observer to be notified as more
     *                  of the image is converted.  May be 
     *                  <code>null</code>
     * @return          <code>true</code> if the image is completely 
     *                  loaded and was painted successfully; 
     *                  <code>false</code> otherwise.
     * @see             Image
     * @see             ImageObserver
     * @since           1.0
     */
    public abstract boolean drawImage(Image img, int x, int y, 
                                      ImageObserver observer);


    /**
     * Dispose of the system resources used by this graphics context.
     * The Graphics context cannot be used after being disposed of.
     * While the finalization process of the garbage collector will
     * also dispose of the same system resources, due to the number
     * of Graphics objects that can be created in short time frames
     * it is preferable to manually free the associated resources
     * using this method rather than to rely on a finalization
     * process which may not happen for a long period of time.
     * <p>
     * Graphics objects which are provided as arguments to the paint
     * and update methods of Components are automatically disposed
     * by the system when those methods return.  Programmers should,
     * for efficiency, call the dispose method when finished using
     * a Graphics object only if it was created directly from a
     * Component or another Graphics object.
     *
     * @see       #create(int, int, int, int)
     * @see       #finalize()
     * @see       Component#getGraphics()
     * @see       Component#paint(Graphics)
     * @see       Component#update(Graphics)
     * @since     1.0
     */
    public abstract void dispose();

    /**
     * Disposes of this graphics context once it is no longer 
     * referenced.
     *
     * @see       #dispose()
     * @since     1.0
     */
    public void finalize() {
        dispose();
    }
}
```
- sample from [javapractices](http://www.javapractices.com/topic/TopicAction.do?Id=44)
```
import java.io.*;

/**
* If a null object parameter is passed to any method, then a
* <tt>NullPointerException</tt> will be thrown.
*/
public final class WriteTextFile {

  //..other methods elided

  /**
  * Change the contents of a text file in its entirety, overwriting any
  * existing text.
  *
  * @param aFile is an existing file (not a directory) which can be written.
  * @param aContents is the text to be placed into aFile.
  *
  * @exception FileNotFoundException if aFile does not exist.
  * @exception IOException if stream to aFile cannot be written to or closed.
  *
  * @exception IllegalArgumentException if aFile is a directory.
  * @exception IllegalArgumentException if aFile cannot be written.
  * @exception SecurityException if a SecurityManager exists and
  * disallows read or write access to aFile.
  */
  static public void setContents(File aFile, String aContents)
                                 throws FileNotFoundException, IOException {
    if (aFile == null) {
      throw new NullPointerException("File must not be null.");
    }
    if (aContents == null) {
      throw new NullPointerException("Contents must not be null.");
    }
    if (!aFile.exists()) {
      throw new FileNotFoundException ("File does not exist: " + aFile);
    }
    if (!aFile.isFile()) {
      throw new IllegalArgumentException("Must not be a directory: " + aFile);
    }
    if (!aFile.canWrite()) {
      throw new IllegalArgumentException("File cannot be written: " + aFile);
    }

    try (Writer output = new BufferedWriter(new FileWriter(aFile))) {
      output.write(aContents);
    }
  }

  public static void main (String... aArguments) throws IOException {
    File testFile = new File("C:\\Temp\\blah.txt");
    setContents(testFile, "blah blah blah");
  }
} 
```

### @thorws description
- [Documenting Exceptions with @throws Tag](http://www.oracle.com/technetwork/java/javase/documentation/index-137868.html#throwstag)
- [javapractices - Avoid @throws in javadoc](http://www.javapractices.com/topic/TopicAction.do?Id=171)
- [javapractices - Javadoc all exceptions](http://www.javapractices.com/topic/TopicAction.do?Id=44)  