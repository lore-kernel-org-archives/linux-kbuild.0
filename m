Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39858 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbfAOHPq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Jan 2019 02:15:46 -0500
Date: Tue, 15 Jan 2019 17:15:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove top-level built-in.a
References: <1547436479-10491-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547436479-10491-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Message-Id: <1547536378.afs6amsrzj.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Masahiro Yamada's on January 14, 2019 1:27 pm:
> The symbol table in the final archive is unneeded because it is passed
> to the linker after the --whole-archive option. Every object file in
> the archive is included in the link anyway.
>=20
> Pass thin archives from subdirectories directly to the linker, and
> remove the final archiving step.

This seems like a good improvement. As far as I remember, it was slower=20
to do the final link without the index built. Maybe I was testing it=20
in a revision before moving those files into --whole-archive? If there
is no slowdown, then I have no objection.

Acked-by: Nicholas Piggin <npiggin@gmail.com>
=
