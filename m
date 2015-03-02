Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.citrix.com ([66.165.176.89]:21786 "EHLO SMTP.CITRIX.COM"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751077AbbCBLAp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Mar 2015 06:00:45 -0500
Message-ID: <54F442B6.1050400@citrix.com>
Date: Mon, 2 Mar 2015 11:00:06 +0000
From: David Vrabel <david.vrabel@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RESEND Patch V2 0/4] xen: auto-generate symbols
 for xen hypercalls
References: <1421826565-10826-1-git-send-email-jgross@suse.com>
In-Reply-To: <1421826565-10826-1-git-send-email-jgross@suse.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, x86@kernel.org, xen-devel@lists.xensource.com, konrad.wilk@oracle.com, david.vrabel@citrix.com, boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, mmarek@suse.cz, linux-kbuild@vger.kernel.org

On 21/01/15 07:49, Juergen Gross wrote:
> The Xen hypercalls are defined in include/xen/interface/xen.h. There
> are some places where for each hypercall a table element is created.
> Instead of manually add each hypercall element to these tables use
> an auto generated header built during the make process of the kernel.

Applied to devel/for-linus-4.1, thanks.

David
