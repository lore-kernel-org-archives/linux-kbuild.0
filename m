Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:46743 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752822Ab2HDGYA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Aug 2012 02:24:00 -0400
Received: by wibhr14 with SMTP id hr14so165755wib.1
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Aug 2012 23:23:59 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 3 Aug 2012 23:23:58 -0700
Message-ID: <CAH5vBd+oq3CRns4zt96cKGToGuCDkq0-H4PQfApA-0C-DBp+7A@mail.gmail.com>
Subject: fix warning: (DRM_NOUVEAU) selects ACPI_WMI
From: cheng renquan <crquan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Dave Airlie <airlied@redhat.com>

I see NOUVEAU is moved out of X86_PLATFORM_DEVICES, but it selects
ACPI_WMI & MXM_WMI
which are still under X86_PLATFORM_DEVICES menu, causing such warning
if I selected DRM_NOUVEAU while not X86_PLATFORM_DEVICES:

[archuser@archtop linux-3.5]$ make oldconfig
scripts/kconfig/conf --oldconfig Kconfig
warning: (DRM_NOUVEAU) selects ACPI_WMI which has unmet direct
dependencies (X86 && X86_PLATFORM_DEVICES && ACPI)
warning: (DRM_NOUVEAU) selects MXM_WMI which has unmet direct
dependencies (X86 && X86_PLATFORM_DEVICES && ACPI_WMI)
warning: (DRM_NOUVEAU) selects ACPI_WMI which has unmet direct
dependencies (X86 && X86_PLATFORM_DEVICES && ACPI)
warning: (DRM_NOUVEAU) selects MXM_WMI which has unmet direct
dependencies (X86 && X86_PLATFORM_DEVICES && ACPI_WMI)
#
# configuration written to .config
#

I think this may be a general error of kconfig direct dependencies system:
whenever a sub item (ACPI_WMI here) is selected by something else
(DRM_NOUVEAU here)
while the item's parent (X86_PLATFORM_DEVICES) dependency is unmet,
shouldn't we select all its dependency automatically?

in this case, maybe easier just fix DRM_NOUVEAU to also select
X86_PLATFORM_DEVICES,
but I think it's not the right way and in future we will have more
similar warnings
