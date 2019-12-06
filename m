Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f50.google.com ([209.85.210.50]:44840 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfLFUMH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Dec 2019 15:12:07 -0500
Received: by mail-ot1-f50.google.com with SMTP id x3so6840890oto.11
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Dec 2019 12:12:07 -0800 (PST)
MIME-Version: 1.0
From: Martin Galvan <omgalvan.86@gmail.com>
Date: Fri, 6 Dec 2019 17:11:55 -0300
Message-ID: <CAN19L9G-mFN-MTmw0FS3ZX4d1MjeoL2U+s-Fk7Qw9UYWn5Q1YA@mail.gmail.com>
Subject: Some header files being ignored when calculating srcversion
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, michal.lkml@markovi.net, yamada.masahiro@socionext.com

Hi all,

I'm working on a kernel module and noticed that sometimes my changes
to certain header files don't affect the module's srcversion hash.
This matters because tools like dkms will refuse to upgrade a module
if the new hash is the same as the one currently installed.

The files being ignored are those that are not (however indirectly)
included by a .c placed in the same directory. In my case, I have a
header which is included by several .c files placed in other
directories; changes to this header won't affect the final srcversion
hash.

The cause of this seems to be this check in sumversion.c:

/* Check if this file is in same dir as objfile */
if ((strstr(line, dir)+strlen(dir)-1) == strrchr(line, '/')) {
    if (!parse_file(line, md)) {
        warn("could not open %s: %s\n",
             line, strerror(errno));
        goto out_file;
    }

}

I'm not sure what's the rationale behind this check, not whether this
behavior is documented anywhere.
