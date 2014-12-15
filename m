Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:46966 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbaLOLp2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Dec 2014 06:45:28 -0500
Message-ID: <548EC9D4.6080706@cantab.net>
Date: Mon, 15 Dec 2014 11:45:24 +0000
From: David Vrabel <dvrabel@cantab.net>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/4] xen: synchronize include/xen/interface/xen.h
 with xen
References: <1418321065-10212-1-git-send-email-jgross@suse.com> <1418321065-10212-3-git-send-email-jgross@suse.com>
In-Reply-To: <1418321065-10212-3-git-send-email-jgross@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, x86@kernel.org, xen-devel@lists.xensource.com, konrad.wilk@oracle.com, david.vrabel@citrix.com, boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, mmarek@suse.cz, linux-kbuild@vger.kernel.org

On 11/12/14 18:04, Juergen Gross wrote:
> The header include/xen/interface/xen.h doesn't contain all definitions
> from Xen's version of that header. Update it accordingly.

Reviewed-by: David Vrabel <david.vrabel@citrix.com>

David
