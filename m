Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35811 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753362AbcJRCMT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Oct 2016 22:12:19 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u9I29GCm113606
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Oct 2016 22:12:18 -0400
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
        by mx0b-001b2d01.pphosted.com with ESMTP id 264xabt2x7-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Oct 2016 22:12:18 -0400
Received: from localhost
        by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Tue, 18 Oct 2016 12:12:15 +1000
Subject: Re: [PATCH 2/2] builddeb: allow building without headers/firmware
 packages
References: <20160826081716.9435-1-andrew.donnellan@au1.ibm.com>
 <20160826081716.9435-2-andrew.donnellan@au1.ibm.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Tue, 18 Oct 2016 13:12:11 +1100
MIME-Version: 1.0
In-Reply-To: <20160826081716.9435-2-andrew.donnellan@au1.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <3149e502-1a4c-0413-b874-d40ed5bf4a42@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 26/08/16 18:17, Andrew Donnellan wrote:
> Currently, the deb-pkg and bindeb-pkg targets create multiple packages for
> the kernel binaries, headers, userspace headers and firmware.
>
> For developers who generate Debian packages as part of their development
> workflows, it's often not necessary to generate all these packages.
>
> Allow the creation of the linux-headers, linux-libc-dev and linux-firmware
> packages to be disabled if the environment variables KDEB_NO_HEADERS,
> KDEB_NO_LIBC_HEADERS or KDEB_NO_FIRMWARE are non-empty.
>
> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Ping :)

> On top of d3e2773c4ede5c62d2a92dae20e3a09b1ca55b6e in kbuild#rc-fixes

This of course is now in mainline.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

