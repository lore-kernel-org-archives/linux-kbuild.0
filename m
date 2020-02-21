Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:63232 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727781AbgBUQMt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 11:12:49 -0500
From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [RFC PATCH v2 3/4] ARM: dts: stm32: Add dtb build information entry for stm32mp157c-dk2
Date: Fri, 21 Feb 2020 17:12:16 +0100
Message-ID: <20200221161217.20069-4-alexandre.torgue@st.com>
In-Reply-To: <20200221161217.20069-1-alexandre.torgue@st.com>
References: <20200221161217.20069-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Ian Lepore <ian@freebsd.org>

dtb-build.txt is a file containing device tree build information (date,
source version ...). This file is used to fill "build-info" entry which
will be displayed during kernel boot.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index 7985b80967ca..387d3bcf5fa3 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -15,6 +15,7 @@
 / {
 	model = "STMicroelectronics STM32MP157C-DK2 Discovery Board";
 	compatible = "st,stm32mp157c-dk2", "st,stm32mp157";
+	build-info = /incbin/("dtb-build.txt");
 
 	aliases {
 		ethernet0 = &ethernet0;
-- 
2.17.1
