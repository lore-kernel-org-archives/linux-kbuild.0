Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outbound.smtp.vt.edu ([198.82.183.121]:39854 "EHLO
        omr2.cc.vt.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751439AbdHJXoc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Aug 2017 19:44:32 -0400
Received: from mr4.cc.vt.edu (mr4.cc.vt.edu [IPv6:2607:b400:92:8300:0:7b:e2b1:6a29])
        by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id v7AMwPZj019628
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Aug 2017 18:58:25 -0400
Received: from mail-qk0-f200.google.com (mail-qk0-f200.google.com [209.85.220.200])
        by mr4.cc.vt.edu (8.14.7/8.14.7) with ESMTP id v7AMwKs1015382
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Aug 2017 18:58:25 -0400
Received: by mail-qk0-f200.google.com with SMTP id k126so10386168qke.8
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Aug 2017 15:58:25 -0700 (PDT)
From: valdis.kletnieks@vt.edu
Subject: Re: make clean all broken with -j? + question regarding modpost
In-Reply-To: <20170810154251.GA23083@localhost.localdomain>
References: <20170810154251.GA23083@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1502405898_2116P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Thu, 10 Aug 2017 18:58:18 -0400
Message-ID: <38798.1502405898@turing-police.cc.vt.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

--==_Exmh_1502405898_2116P
Content-Type: text/plain; charset=us-ascii

On Thu, 10 Aug 2017 17:42:51 +0200, Thomas Meyer said:

> 1.) make with multiple targets
>
> When running
> $ make -j4 clean all
> I get error from make (probably in scripts/Makefile.modbuiltin):
> Output from above with V=1:

Possibly unrelated, but I suspect there's a bunch of weirdness lurking in there.

I often end up building lots of kernels (especially during a bisect), and
I've noticed that if I do a 'git bisect good/bad' and then do

make modconfig; make -j4   it will in fact do 4 streams.

But if I just say 'make -j4' and it decides it needs to do a modconfig,
it will then apparently lose the -j4 somewhere and run just one stream.
(But if it doesn't do a modconfig, the -j4 works...)

--==_Exmh_1502405898_2116P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.8.0 04/21/2017

iQEVAwUBWYzlCo0DS38y7CIcAQKOTAf/fKl3beXDd0g4xDyk0T8vWl6uRPPiW5l4
9n5Dp+M2ENHlGPUxfwo7404SiSEtkC2aimms85ekUQBxEVvUyHX48GFd+at+MuMx
aYmyb3vbED69UHTOOAfuODWP27Flc3EG1qceF3HjCRuX4lfDQsDUbf9UbZ2MQLDc
tmLnzF3AUZXc/Fi7oZYRd3o0v0EoI+ULhVd/wCaFjKZQ5GqVEDq0HWrdkdbYkFTr
WDKDN/08TQ3KuFp58fsu79RoGd0f9XkiAVlLLiAUh1WSYWPE9JpAUvrj5hP6zfjI
O0TNrIyRkB7bHI3JaB65+uNooXFT9S3B2N3EcoYht2mdlmlIlg/nEA==
=Jmhf
-----END PGP SIGNATURE-----

--==_Exmh_1502405898_2116P--
