Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:32973 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752046AbdLNT4l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Dec 2017 14:56:41 -0500
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Applying Facebook's static analysis tool Infer
Date: Thu, 14 Dec 2017 20:54:09 +0100
Message-Id: <1513281250-9186-1-git-send-email-lukas.bulwahn@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Alexey Dobriyan <adobriyan@gmail.com>, lukas.bulwahn@gmail.com, sil2review@lists.osadl.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Hi,

this is a first patch of my work to apply Facebook's static analysis tool
Infer (http://fbinfer.com) on the Linux kernel source code.

I am starting the analysis and patching on the kernel scripts and tools.
Further analysis of the kernel will then probably require more tweaking of
the static analysis tool to handle the kernel source code appropriately.

As I will continue to send patches following the same commit-message scheme
to issues that Infer finds, let me know if further output information from
the tool should be included or condensed in the commit message.

Lukas
