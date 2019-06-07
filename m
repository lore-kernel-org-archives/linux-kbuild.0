Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f181.google.com ([209.85.222.181]:42840 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729241AbfFGQ6q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Jun 2019 12:58:46 -0400
Received: by mail-qk1-f181.google.com with SMTP id b18so1670899qkc.9
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Jun 2019 09:58:45 -0700 (PDT)
MIME-Version: 1.0
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Fri, 7 Jun 2019 12:58:33 -0400
Message-ID: <CAJoBWHw2yPgT_25UVF_3tTx6_FfZMBbDqVW5TASb4aPu2JKHZg@mail.gmail.com>
Subject: Adding new build target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi all,

Now that the kernel can be built with clang, I'd like to implement a
new build target to generate LLVM bytecode for all C source files
involved for a specific build configuration.  I am thinking that this
should be very simple if I know the make variables that captures the
needed information.  Specifically, I think I just need to perform the
following command for all C files:

clang -emit-llvm -c <appropriate CFLAGS and include paths> <source
file> -o <corresponding object file location>.bc

My problem is that I don't know how to get the info in the brackets,
but I am thinking that I should make a new build target `bytecode`.
Any help would be appreciated.  Thanks.

Derrick McKee
