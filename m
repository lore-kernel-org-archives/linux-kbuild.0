Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gateway.imaginecommunications.com ([212.199.94.2]:42561 "EHLO
	venus.imagineil.tv" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752691AbYDQLze convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@VGER.KERNEL.ORG>);
	Thu, 17 Apr 2008 07:55:34 -0400
From: Jacob Avraham <jacob@imaginecommunications.com>
Date: Thu, 17 Apr 2008 14:49:36 +0300
Subject: using initramfs with modules
Message-ID: <FF584854D6FFE547AB2F7515A798AC3A02834DCDD1@venus.imagineil.tv>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "linux-kbuild@VGER.KERNEL.ORG" <linux-kbuild@vger.kernel.org>

Hi,

I want to build a kernel with initramfs image that contains some modules that are part of my kernel tree.
I created a file list and passed it as a parameter to the kernel configuration (make menuconfig).
That list contains the module names from my kernel tree (some *.ko files).
The problem is that the kernel build process builds usr/initramfs_data.cpio.gz at a very early stage,
At which none of the modules were compiled yet.
The result is that on a fresh tree the build will fail, or if the modules exist, a stale build is taken into the initramfs archive.

Is this a known bug?
Is there a way to cause the initramfs image to be built last?

Thanks,

Jacob
