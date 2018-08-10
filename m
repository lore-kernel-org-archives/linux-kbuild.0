Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46539 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbeHJJyo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Aug 2018 05:54:44 -0400
Received: by mail-ua1-f67.google.com with SMTP id u11-v6so913225uan.13
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Aug 2018 00:26:07 -0700 (PDT)
MIME-Version: 1.0
From: Faisal Mehmood <f.m3hm00d@gmail.com>
Date: Fri, 10 Aug 2018 12:30:24 +0500
Message-ID: <CAL8qismn-pAKiGRi-BjadSBHd=KoMAjG2di9h9dLjDTQzeejtA@mail.gmail.com>
Subject: HELP: Count Lines of Code in Custom Compiled Kernel
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

So I compiled a custom minimal Linux Kernel. I want to list all the
source files used for this particular .config file. I also want to
count the lines of code against that .config file compilation.

I tried using 'make  > logfile', but that only lists the generated
object files. Source files are not listed.
'find . -type f -name *.[ch]' includes all the source files, while I
only need those that are being used by my .config file.

Regards.
