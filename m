Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.citrix.com ([66.165.176.89]:54010 "EHLO SMTP.CITRIX.COM"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752232AbaLOLqb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Dec 2014 06:46:31 -0500
Message-ID: <548ECA14.9040805@citrix.com>
Date: Mon, 15 Dec 2014 11:46:28 +0000
From: David Vrabel <david.vrabel@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/4] xen: use generated hypervisor symbols
 in arch/x86/xen/trace.c
References: <1418321065-10212-1-git-send-email-jgross@suse.com> <1418321065-10212-4-git-send-email-jgross@suse.com>
In-Reply-To: <1418321065-10212-4-git-send-email-jgross@suse.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, x86@kernel.org, xen-devel@lists.xensource.com, konrad.wilk@oracle.com, david.vrabel@citrix.com, boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, mmarek@suse.cz, linux-kbuild@vger.kernel.org

On 11/12/14 18:04, Juergen Gross wrote:
> Instead of manually list all hypervisor calls in arch/x86/xen/trace.c
> use the auto generated list.

Reviewed-by: David Vrabel <david.vrabel@citrix.com>

David
