Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:41287 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgETMSt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 May 2020 08:18:49 -0400
MIME-Version: 1.0
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-4-masahiroy@kernel.org> <20200519102133.GA279905@hirez.programming.kicks-ass.net>
In-Reply-To: <20200519102133.GA279905@hirez.programming.kicks-ass.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 20 May 2020 21:17:45 +0900
Message-ID: <CAK7LNARkUkdRsW0D5cc5cEtXFJfnKhiVuZvrD6T1Xg3sr9kv=A@mail.gmail.com>
Subject: Re: [PATCH 03/29] modpost: add read_text_file() and get_line() helpers
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, May 19, 2020 at 7:21 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sun, May 17, 2020 at 06:48:33PM +0900, Masahiro Yamada wrote:
>
> > +char *read_text_file(const char *filename)
> > +{
> > +     struct stat st;
> > +     int fd;
> > +     char *buf;
> > +
> > +     fd = open(filename, O_RDONLY);
> > +     if (fd < 0)
> > +             return NULL;
> > +
> > +     if (fstat(fd, &st) < 0)
> > +             return NULL;
> > +
> > +     buf = NOFAIL(malloc(st.st_size + 1));
> > +
> > +     if (read(fd, buf, st.st_size) != st.st_size) {
>
> Is this sensible coding ? I've always been taught read() can return
> early/short for a number of reasons and we must not assume this is an
> error.
>
> The 'normal' way to read a file is something like:
>
>         for (;;) {
>                 ssize_t ret = read(fd, buf + size, st.st_size - size);
>                 if (ret < 0) {
>                         free(buf);
>                         buf = NULL;
>                         goto close;
>                 }
>                 if (!ret)
>                         break;
>
>                 size += ret;
>         }
>
> > +             free(buf);
> > +             buf = NULL;
> > +             goto close;
> > +     }
> > +     buf[st.st_size] = '\0';
> > +close:
> > +     close(fd);
> > +
> > +     return buf;
> > +}


In theory, I think yes.

But, is it necessary when we know
it is reading a regular file?



The specification [1] says this:

"The value returned may be less than nbyte if the number of bytes
left in the file is less than nbyte, if the read() request was
interrupted by a signal, or if the file is a pipe or FIFO or
special file and has fewer than nbyte bytes immediately available
for reading."


This case does not meet any of 'if ...' parts.

[1] https://pubs.opengroup.org/onlinepubs/000095399/functions/read.html


-- 
Best Regards
Masahiro Yamada
