Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:50815 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752616Ab1KNSRS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Nov 2011 13:17:18 -0500
Message-ID: <4EC15B2D.5000407@codeaurora.org>
Date: Mon, 14 Nov 2011 10:17:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/tags.sh: Add Page flag function magic
References: <1320340197-9063-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1320340197-9063-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 11/03/11 10:09, Stephen Boyd wrote:
> It takes a while to find the macro-magically defined Page*()
> functions defined in include/linux/page-flags.h if you're new to
> the kernel. Add some magic to the tags script to transform these
> macros into the actual functions they are, so that tag jumping in
> the mm code is a bit easier.
>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>

ping?

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

