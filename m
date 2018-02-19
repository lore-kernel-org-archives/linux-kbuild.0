Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:50397 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753267AbeBSRo3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Feb 2018 12:44:29 -0500
MIME-Version: 1.0
In-Reply-To: <20180219044845.7cnqpgyiinn6hkyb@huvuddator>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
 <1518806331-7101-12-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFwQLrrBeXZXK_qUXiGVFNv3qPJS4tNKFacuk0Y0WgZjCA@mail.gmail.com> <20180219044845.7cnqpgyiinn6hkyb@huvuddator>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Feb 2018 09:44:28 -0800
Message-ID: <CA+55aFwiRzpSRW8xhoMs9cbFFXZGmEyyVa4a7aeZzQGYuO211w@mail.gmail.com>
Subject: Re: [PATCH 11/23] kconfig: add 'shell-stdout' function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Feb 18, 2018 at 8:48 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> On Fri, Feb 16, 2018 at 11:17:52AM -0800, Linus Torvalds wrote:
>>
>> Can we *please* make "shell-stdout" go away, and make this just be "shell"?
>>
>> The rule would be very simple:
>>
>>  - if the result of the shell command is a failure, the result is 'n'
>>
>>  - otherwise, the result is the first line of stdout
>>
>>  - if the result is empty, we replace it with 'y'.
>
> Could there be cases where you'd legitimately want to put empty output
> from a command in a string (that would be common enough to matter)?
> That'd get messier with the above rule, as it never generates an empty
> string as output.

Hmm. Maybe. Something like "LOCALVERSION_AUTO" might want that where
you add a version string if something is true, and maybe you'd use a
shell script for it and generate it at Kconfig time.

I'm not seeing anything like that right now, but I could imagine it in
theory, so your worry is valid.

> Would you still be as opposed (or more opposed...) to having two
> functions if they were called something like 'success' and 'stdout'
> instead?

Maybe the naming is indeed what annoyed me the most.

I do like your "success"/"stdout" more than "shell"/"shell-stdout",
because with that naming I don't get the feeling that one should
subsume the other.

          Linus
