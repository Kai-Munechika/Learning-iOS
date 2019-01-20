//
//  MockData.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/10/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation

class MockData {
    
    static let mockMangaUrl = "https://kissmanga.com/Manga/Tate-no-Yuusha-no-Nariagari"
    static let mockChapterUrl = "https://kissmanga.com/Manga/Tate-no-Yuusha-no-Nariagari/Vol-001-Ch-008-Read-Online?id=207420"
    
    static let mockChapter = Chapter(name: "Constant Changes", imageUrls: [
        "https://2.bp.blogspot.com/-wW246HYFsNs/XDZxdmlHbjI/AAAAAAACOGc/Er8a4PXlNpMZXtzDQJH-jfIZSdK0w6WkwCHMYCw/s0/000.png", 
        "https://2.bp.blogspot.com/-yB6u6RXa5fI/XDZxd8OS9FI/AAAAAAACOGg/RtcCx7xS5bksMqBPc4aMp_UatuJQSEAEACHMYCw/s0/001.png", 
        "https://2.bp.blogspot.com/-nnEQSiisxgk/XDZxeD7zi6I/AAAAAAACOGk/3QLf5_wXk4U0akXkAE1XVk8xyGZgRbjHwCHMYCw/s0/002.png", 
        "https://2.bp.blogspot.com/-lt6p6DIHvcc/XDZxel6S-2I/AAAAAAACOGo/0qZXuXlQTLUI8jjxe5aZ3x8Z5uecNy4twCHMYCw/s0/003.png", 
        "https://2.bp.blogspot.com/-1Uy84D69yYM/XDZxe3DpKPI/AAAAAAACOGs/9QLLR34anFgxKjpRJiBDoGF7TCluayoNACHMYCw/s0/004.png", 
        "https://2.bp.blogspot.com/-4VMLEP-4tpk/XDZxfKvQHbI/AAAAAAACOGw/OY8ajoRu1NAA907k04POfywb90uGq4jvQCHMYCw/s0/005.png", 
        "https://2.bp.blogspot.com/-ocO6y4wB1aI/XDZxflW85QI/AAAAAAACOG0/ax9WbRn5xvYWtCQi0KdrKnGFU8zBnSEFQCHMYCw/s0/006.png", 
        "https://2.bp.blogspot.com/-s5dVPgATTZQ/XDZxf3rjIiI/AAAAAAACOG4/u4vM6anMKsMqqXqpV8eXngMpRGbjehbQQCHMYCw/s0/007.png", 
        "https://2.bp.blogspot.com/-meaWONBP__E/XDZxgN0o6iI/AAAAAAACOG8/b5_t0C9aLaMYa5xlGIPH9fDAE4-tvJiVACHMYCw/s0/008.png", 
        "https://2.bp.blogspot.com/-PZvpXM1361U/XDZxgjY3JUI/AAAAAAACOHA/YDuT9JUb2NQEHPIVoHC9vbo5vn87mWPHACHMYCw/s0/009.png", 
        "https://2.bp.blogspot.com/-_u74krG4UrE/XDZxg0CtF4I/AAAAAAACOHE/BqoA-709WiA0_LmNLWt_KZP_nJhgIc9fgCHMYCw/s0/010.png", 
        "https://2.bp.blogspot.com/-pp3DJO3gcZM/XDZxhOeZcnI/AAAAAAACOHI/UoFteD0i394C9Gsn3mehJEad3D9Ko9RugCHMYCw/s0/011.png", 
        "https://2.bp.blogspot.com/-2V2RXN6bVHM/XDZxhWD4GqI/AAAAAAACOHM/dEx2Ac-uAs8EOTGgtpZ6TB4sEyAE8Z13gCHMYCw/s0/012.png", 
        "https://2.bp.blogspot.com/-sLskU1xFk_g/XDZxh6EhdQI/AAAAAAACOHQ/hVVcOlM4ujoWnY_rGJtM_K0hOIsPfHbqgCHMYCw/s0/013.png", 
        "https://2.bp.blogspot.com/-vcIVqV5UppY/XDZxiJ9UqiI/AAAAAAACOHU/CTNZd_THAOYAMwONlv5lFkzh1vYj_oAWwCHMYCw/s0/014.png",
        "https://2.bp.blogspot.com/-EcluTxivkcg/XDZxiT6i3EI/AAAAAAACOHY/9PO7YVBomGEflyQBFmdJBVxMcOn9cvvUQCHMYCw/s0/015.png",
        "https://2.bp.blogspot.com/-nanVu7aAUk8/XDZxi6HQy2I/AAAAAAACOHc/f8AGbTZ1UKo7mslPg2S1dOfJz2DI-K8WgCHMYCw/s0/016.png"
        ])
    
    static let kissMangaPreScreenHtml = """
<body>
<div>
<div style="position: relative; height: 130px;">
<div style="max-width: 635px; margin: 0 auto; z-index: 1000; text-align: center;
position: relative; margin-top: 150px; width: 100%">
<img id="imgLogo" alt="jadopado" style="display: inline-block;" src="data:image/gif;charset=binary;base64,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"><br>
</div>
</div>
<div>
<div style="text-align: center">
Please wait 5 seconds...<br>Make sure to enable cookies and javascript.<br>This site does not work with CHROME DATA SAVER and "Mini browsers" (e.g. UC mini, Opera mini...)
</div>
<div style="margin: 0 auto; visibility: hidden">
<div class="cf-browser-verification cf-im-under-attack">
<noscript>&lt;h1 data-translate="turn_on_js" style="color:#bd2426;"&gt;Please turn JavaScript on and reload the page.&lt;/h1&gt;</noscript>
<div id="cf-content" style="display: block;">

<div>
<div class="bubbles"></div>
<div class="bubbles"></div>
<div class="bubbles"></div>
</div>
<h1>
<span data-translate="checking_browser">Checking your browser before accessing</span> kissmanga.com.</h1>

<p data-translate="process_is_automatic">This process is automatic. Your browser will redirect to your requested content shortly.</p>
<p data-translate="allow_5_secs">Please allow up to 5 seconds…</p>
</div>

<form id="challenge-form" action="/cdn-cgi/l/chk_jschl" method="get">
<input type="hidden" name="jschl_vc" value="9508cd92a9fd7e302c9e90881e9d2449">
<input type="hidden" name="pass" value="1547172228.732-37NK+kPO4h">
<input type="hidden" id="jschl-answer" name="jschl_answer">
</form>
</div>

</div>
</div>
<div style="padding: 20px;">
</div>
</div>


</body>
"""
    

}
