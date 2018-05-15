Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754174AbeEOOn1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 May 2018 10:43:27 -0400
Date: Tue, 15 May 2018 10:43:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 3/4] powerpc/kbuild: Use flags variables rather than
 overriding LD/CC/AS
Message-ID: <20180515104324.5230d827@gandalf.local.home>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org

On Tue, 15 May 2018 15:24:21 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> > Have you tried building all current archs with function tracing enabled
> > to make sure this doesn't break any of them? I can do it if you want.  
> 
> We shouldn't need to should we? This is only touching powerpc specific
> code (if I understand perl that is).
> 
> eg:
> 
> $ git diff -U9 scripts/recordmcount.pl

Thanks for the added context!

Yeah, I don't look at that code much anymore since I mainly deal with
recordmcount.c now-a-days. I wonder if someone should port ppc to that.
It is also no my todo list to merge that with objtool.

Anyway,

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve


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
>      $mcount_regex = "^\\s*([0-9a-fA-F]+):\\s*R_ARM_(CALL|PC24|THM_CALL)" .
>                         "\\s+(__gnu_mcount_nc|mcount)\$";
>  
>  } elsif ($arch eq "arm64") {
>      $alignment = 3;
> 
> 
> cheers

