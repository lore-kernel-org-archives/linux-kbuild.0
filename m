Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:4750 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728760AbgAMSQv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 13:16:51 -0500
From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [RFC PATCH 0/3] Add device tree build information
Date: Mon, 13 Jan 2020 19:16:22 +0100
Message-ID: <20200113181625.3130-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

Hi,

The goal of this series is to add device tree build information in dtb.
This information can be dtb build date, where devicetree files come from,
who built the dtb ... Actually, same kind of information that you can find
in the Linux banner which is printout during kernel boot. Having the same
kind of information for device tree is useful for debugging and maintenance.

To achieve that a new option "-B" (using an argument) is added to dtc. 
The argument is a file containing a string with build information
(e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
DTC use it to append dts file with a new string property "Build-info".

of/fdt.c is modified to printout "Build-info" property during Kernel boot and 
scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
last part could be improved for sure).

Regards
Alex

Alexandre Torgue (3):
  dtc: Add dtb build information option
  of: fdt: print dtb build information
  scripts: Use -B dtc option to generate dtb build information.

 drivers/of/fdt.c           |  9 +++++++
 scripts/Makefile.lib       | 11 +++++---
 scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
 scripts/gen_dtb_build_info | 11 ++++++++
 4 files changed, 76 insertions(+), 10 deletions(-)
 create mode 100755 scripts/gen_dtb_build_info

-- 
2.17.1
