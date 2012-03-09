Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:41688 "EHLO
	new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753115Ab2CIWNQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Mar 2012 17:13:16 -0500
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 3E49E46F
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Mar 2012 17:13:16 -0500 (EST)
Message-ID: <4F5A8079.5090800@signal11.us>
Date: Fri, 09 Mar 2012 17:13:13 -0500
From: Alan Ott <alan@signal11.us>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] Makefile: Add INSTALL_MOD_PATH to the environment
 used by depmod
References: <1331330522-15129-1-git-send-email-alan@signal11.us>
In-Reply-To: <1331330522-15129-1-git-send-email-alan@signal11.us>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Ott <alan@signal11.us>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/09/2012 05:02 PM, Alan Ott wrote:
> Add INSTALL_MOD_PATH explicitly to the environment given to depmod.  This
> way putting an INSTALL_MOD_PATH line into a GNUmakefile (along with things
> like CROSS_COMPILE) will work properly.
>
> Signed-off-by: Alan Ott <alan@signal11.us>
> ---

To be clear, this was intended to be patch 1/1. Sorry for the noise.
