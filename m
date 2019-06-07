Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34554 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729829AbfFGRUW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Jun 2019 13:20:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id h2so1504668pgg.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Jun 2019 10:20:22 -0700 (PDT)
Date: Fri, 7 Jun 2019 10:20:15 -0700
From: Tom Roeder <tmroeder@google.com>
Subject: Re: Adding new build target
Message-ID: <20190607172015.GA165542@google.com>
References: <CAJoBWHw2yPgT_25UVF_3tTx6_FfZMBbDqVW5TASb4aPu2JKHZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJoBWHw2yPgT_25UVF_3tTx6_FfZMBbDqVW5TASb4aPu2JKHZg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Derrick McKee <derrick.mckee@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Fri, Jun 07, 2019 at 12:58:33PM -0400, Derrick McKee wrote:
> Hi all,
> 
> Now that the kernel can be built with clang, I'd like to implement a
> new build target to generate LLVM bytecode for all C source files
> involved for a specific build configuration.  I am thinking that this
> should be very simple if I know the make variables that captures the
> needed information.  Specifically, I think I just need to perform the
> following command for all C files:
> 
> clang -emit-llvm -c <appropriate CFLAGS and include paths> <source
> file> -o <corresponding object file location>.bc
> 
> My problem is that I don't know how to get the info in the brackets,
> but I am thinking that I should make a new build target `bytecode`.
> Any help would be appreciated.  Thanks.

I know this isn't exactly what you're asking for, but one way to get
kernel object files as bitcode is to add -save-temps=obj to KCFLAGS.
That gives you bitcode for each object file, and you can pull them
together into a single object using llvm-link.

Note that at least when I was experimenting with this, I also needed to
turn off some warnings, because setting -save-temps=obj changes the way
that clang builds the objects. In particular, I needed to set

	-Wno-constant-logical-operand
	-Wno-parentheses-equality
	-Wno-pointer-bool-conversion
	-Wno-self-assign

> 
> Derrick McKee
