Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:45621 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756210AbdIHSje (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Sep 2017 14:39:34 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFzZNpuYjVa4EZ2eJhvtU7-bzZTor_596TA5_CY77j+BEw@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com>
 <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
 <CAK7LNATaisd3tPNbujTWLUq-2sMQ3pyTkPRSgjw00zUzv=GvSQ@mail.gmail.com>
 <CA+55aFwvaZSXubcmaaZD-i5c_F5bHWhr6OBxRM+=7dGueua0Ng@mail.gmail.com> <CA+55aFzZNpuYjVa4EZ2eJhvtU7-bzZTor_596TA5_CY77j+BEw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 8 Sep 2017 11:39:32 -0700
Message-ID: <CA+55aFzz_fv--Kx8phjWt_VOzZOMmbs0XX7_kL--_XRitWwJQA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Markus Heiser <markus.heiser@darmarit.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, SeongJae Park <sj38.park@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

On Fri, Sep 8, 2017 at 11:01 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> It doesn't seem to happen for every exported symbol, though. Odd.

Fascinating.

Picking one file at random that shows this, I did net/ceph/mon_client.c.

The version file that gets generated for that looks like this:

__crc_ceph_monc_want_map = 0x3389a57e;
__crc_ceph_monc_got_map = 0x707f45a2;
__crc_ceph_monc_renew_subs = 0x9842030a;
__crc_ceph_monc_wait_osdmap = 0xfe38746d;
__crc_ceph_monc_open_session = 0xc9ba8a19;
__crc_ceph_monc_do_statfs = 0xe878801b;
__crc_ceph_monc_get_version = 0xfaac6ce0;
__crc_ceph_monc_get_version_async = 0x3adefe28;
__crc_ceph_monc_blacklist_add = 0xee71d0ef;
__crc_ceph_monc_init = 0xfce99654;
__crc_ceph_monc_stop = 0xb0d197d0;
__crc_ceph_monc_validate_auth = 0xce1c6d69;

and with the gperf-removal patch, it is 100% identical _except_ that
the "__crc_ceph_monc_do_statfs" line is missing.

Same hashes for everything else. But one missing line. WTF?

What is special about that one particular function vs the other ones
in that file? I have absolutely no idea.

So the really odd thing here is how things clearly still _work_. The
parser works fine for everything else. And looking at the
gprof-removal patch it's not at all obvious how everything could work
fine except for some random thing.

Strange. Does anybody see what the pattern to the failure is?

                Linus
