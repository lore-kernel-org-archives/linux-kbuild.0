Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:35233 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752773Ab3ISOVc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Sep 2013 10:21:32 -0400
Received: by mail-la0-f41.google.com with SMTP id ec20so7135442lab.0
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2013 07:21:31 -0700 (PDT)
Message-ID: <523B086B.3040206@cogentembedded.com>
Date: Thu, 19 Sep 2013 18:21:31 +0400
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: fix invalid symbolic link file
References: <1379596148-32520-1-git-send-email-maddy@linux.vnet.ibm.com>
In-Reply-To: <1379596148-32520-1-git-send-email-maddy@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: ralf@linux-mips.org, steven.hill@imgtec.com, mmarek@suse.cz, swarren@nvidia.com, linux-mips@linux-mips.org, linux-kbuild@vger.kernel.org, james.hogan@imgtec.com

Hello.

On 09/19/2013 05:09 PM, Madhavan Srinivasan wrote:

>     Commit 3b29aa5ba204c created a symlink file in include/dt-bindings.

    Please also specify that commit's summary line in parens.

>     Even though commit diff is fine, symlink is invalid.
>     ls -lb shows a newline character at the end of the filename.

    Don't indent the changelog please.

> lrwxrwxrwx 1 maddy maddy 35 Sep 19 18:11 dt-bindings ->
> ../../../../../include/dt-bindings\n

> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

WBR, Sergei


