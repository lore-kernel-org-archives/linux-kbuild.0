Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:63546 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387400AbgCDDVF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 22:21:05 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/3] kbuild: improve DT build rules
Date: Wed,  4 Mar 2020 12:20:35 +0900
Message-Id: <20200304032038.14424-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Michal Marek <michal.lkml@markovi.net>


This series is applicable on
Linus' tree + the following two patches:
https://patchwork.kernel.org/patch/11413625/
https://patchwork.kernel.org/patch/11413623/



Masahiro Yamada (3):
  kbuild: avoid concurrency issue in parallel building dtbs and
    dtbs_check
  kbuild: allow to run dt_binding_check and dtbs_check in a single
    command
  kbuild: allow to run dt_binding_check without kernel configuration

 Documentation/devicetree/bindings/Makefile  |  8 +++-----
 Documentation/devicetree/writing-schema.rst |  4 ++++
 Makefile                                    | 16 ++++++++++++----
 scripts/dtc/Makefile                        |  5 +++--
 4 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.17.1
