Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:34403 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbaLQK0s (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Dec 2014 05:26:48 -0500
Message-ID: <54915A65.4030605@citrix.com>
Date: Wed, 17 Dec 2014 10:26:45 +0000
From: David Vrabel <david.vrabel@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [Patch V2 1/4] xen: build infrastructure for generating
 hypercall depending symbols
References: <1418809838-14123-1-git-send-email-jgross@suse.com> <1418809838-14123-2-git-send-email-jgross@suse.com>
In-Reply-To: <1418809838-14123-2-git-send-email-jgross@suse.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, x86@kernel.org, xen-devel@lists.xensource.com, konrad.wilk@oracle.com, david.vrabel@citrix.com, boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, mmarek@suse.cz, linux-kbuild@vger.kernel.org

On 17/12/14 09:50, Juergen Gross wrote:
> Today there are several places in the kernel which build tables
> containing one entry for each possible Xen hypercall. Create an
> infrastructure to be able to generate these tables at build time.

Reviewed-by: David Vrabel <david.vrabel@citrix.com>

David
