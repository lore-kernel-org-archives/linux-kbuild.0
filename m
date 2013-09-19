Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:33476 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751797Ab3ISUgx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Sep 2013 16:36:53 -0400
Message-ID: <523B605F.8090402@wwwdotorg.org>
Date: Thu, 19 Sep 2013 14:36:47 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: git issue / [PATCH] MIPS: fix invalid symbolic link file
References: <1379596148-32520-1-git-send-email-maddy@linux.vnet.ibm.com> <20130919133920.GA22468@linux-mips.org> <523B555E.2070508@kdbg.org>
In-Reply-To: <523B555E.2070508@kdbg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Johannes Sixt <j6t@kdbg.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, git@vger.kernel.org, steven.hill@imgtec.com, mmarek@suse.cz, swarren@nvidia.com, linux-mips@linux-mips.org, linux-kbuild@vger.kernel.org, james.hogan@imgtec.com

On 09/19/2013 01:49 PM, Johannes Sixt wrote:
> Am 19.09.2013 15:39, schrieb Ralf Baechle:
>> The original patch that introduced the symlink with the \n is kernel
>> commit 3b29aa5ba204c62b3ec8f9f5b1ebd6e5d74f75d3 and is archived in
>> patchwork at http://patchwork.linux-mips.org/patch/5745/  The patch
>> file contains a \n at the end - but one would expect that from a
>> patch file that has been transfered via email, so I'm not sure how this
>> is supposed to work with emailed patches?!?
> 
> The mbox file I downloaded from this link looks like this:
...
> but it should look like this:
...
> Whoever or whatever moved the '\ No newline at end of file' line above
> the patch text is to blame.

That sounds like a patchwork problem; the original copy of the message I
received looks correct.
