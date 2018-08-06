Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f181.google.com ([209.85.210.181]:36178 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731432AbeHGBmw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Aug 2018 21:42:52 -0400
Received: by mail-pf1-f181.google.com with SMTP id b11-v6so7590131pfo.3
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Aug 2018 16:31:27 -0700 (PDT)
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 6 Aug 2018 16:31:14 -0700
Message-ID: <CAKwvOdkozP4t3AusfnKfrTmhyrXh4JW4m-ersfnoeTWXcMfJSw@mail.gmail.com>
Subject: debugging kbuild
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Is there a way to print the exact command that's being invoked from
Make? For example, some of the macro's in scripts/Kbuild.include are
tricky to unwind. Is there a way to dump each sub command being run?

-- 
Thanks,
~Nick Desaulniers
