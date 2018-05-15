Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:40550 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752084AbeEOGQf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 May 2018 02:16:35 -0400
Received: by mail-pg0-f68.google.com with SMTP id l2-v6so6535365pgc.7
        for <linux-kbuild@vger.kernel.org>; Mon, 14 May 2018 23:16:35 -0700 (PDT)
Date: Tue, 15 May 2018 16:16:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 3/4] powerpc/kbuild: Use flags variables rather than
 overriding LD/CC/AS
Message-ID: <20180515161625.292897c9@roar.ozlabs.ibm.com>
In-Reply-To: <87tvr9o5iy.fsf@concordia.ellerman.id.au>
References: <20180514035228.21316-1-npiggin@gmail.com>
        <20180514035228.21316-4-npiggin@gmail.com>
        <20180514112826.1b820335@gandalf.local.home>
        <87tvr9o5iy.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org

On Tue, 15 May 2018 15:24:21 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Steven Rostedt <rostedt@goodmis.org> writes:
> > On Mon, 14 May 2018 13:52:27 +1000
> > Nicholas Piggin <npiggin@gmail.com> wrote:  
> >> The powerpc toolchain can compile combinations of 32/64 bit and
> >> big/little endian, so it's convenient to consider, e.g.,
> >> 
> >>   `CC -m64 -mbig-endian`
> >> 
> >> To be the C compiler for the purpose of invoking it to build target
> >> artifacts. So overriding the the CC variable to include thse
> >> flags  
> ...
> >> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
> >> index 191eb949d52c..3c67304a7425 100755
> >> --- a/scripts/recordmcount.pl
> >> +++ b/scripts/recordmcount.pl
> >> @@ -274,6 +274,13 @@ if ($arch eq "x86_64") {
> >>      if ($bits == 64) {
> >>  	$type = ".quad";
> >>      }
> >> +    if ($endian eq "big") {
> >> +	    $cc .= " -mbig-endian ";
> >> +	    $ld .= " -EB ";
> >> +    } else {
> >> +	    $cc .= " -mlittle-endian ";
> >> +	    $ld .= " -EL ";
> >> +    }  
> >
> > Have you tried building all current archs with function tracing
> > enabled to make sure this doesn't break any of them? I can do it if
> > you want.  
> 
> We shouldn't need to should we? This is only touching powerpc specific
> code (if I understand perl that is).

Yeah that wasn't clear from the diff context, it should only have an
affect on powerpc so you shouldn't need to go through other archs.

Thanks,
Nick

> 
> eg:
> 
> $ git diff -U9 scripts/recordmcount.pl
> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
> index 191eb949d52c..3c67304a7425 100755
> --- a/scripts/recordmcount.pl
> +++ b/scripts/recordmcount.pl
> @@ -268,18 +268,25 @@ if ($arch eq "x86_64") {
>  } elsif ($arch eq "powerpc") {
>      $local_regex = "^[0-9a-fA-F]+\\s+t\\s+(\\.?\\S+)";
>      # See comment in the sparc64 section for why we use '\w'.
>      $function_regex = "^([0-9a-fA-F]+)\\s+<(\\.?\\w*?)>:";
>      $mcount_regex = "^\\s*([0-9a-fA-F]+):.*\\s\\.?_mcount\$";
>  
>      if ($bits == 64) {
>         $type = ".quad";
>      }
> +    if ($endian eq "big") {
> +           $cc .= " -mbig-endian ";
> +           $ld .= " -EB ";
> +    } else {
> +           $cc .= " -mlittle-endian ";
> +           $ld .= " -EL ";
> +    }
>  
>  } elsif ($arch eq "arm") {
>      $alignment = 2;
>      $section_type = '%progbits';
>      $mcount_regex =
> "^\\s*([0-9a-fA-F]+):\\s*R_ARM_(CALL|PC24|THM_CALL)" .
> "\\s+(__gnu_mcount_nc|mcount)\$"; 
>  } elsif ($arch eq "arm64") {
>      $alignment = 3;
> 
> 
> cheers

