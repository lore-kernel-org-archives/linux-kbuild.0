Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:13645 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750797Ab2EINxp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 May 2012 09:53:45 -0400
Message-ID: <4FAA76E7.1070807@linux.intel.com>
Date: Wed, 09 May 2012 06:53:43 -0700
From: "H. Peter Anvin" <hpa@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 04/23] x86, realmode: Move reboot_32.S to unified realmode
 code
References: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com> <1336501366-28617-5-git-send-email-jarkko.sakkinen@intel.com> <4FAA18F1.6080508@redhat.com> <alpine.DEB.2.02.1205091525100.6943@jsakkine-mobl2.(null)>
In-Reply-To: <alpine.DEB.2.02.1205091525100.6943@jsakkine-mobl2.(null)>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joseph Cihula <joseph.cihula@intel.com>, Shane Wang <shane.wang@intel.com>

On 05/09/2012 05:37 AM, Jarkko Sakkinen wrote:
> 
> It's true that it doesn't matter much but still it is a
> regression. And it doesn't cause any kind of overhead
> or bloat to fix this.
> 

However, the big thing is that we jump to the BIOS with caches off.  I
personally think it is the wrong thing to do (we don't jump to the real
reset vector anyway) but it is what has been tested for a long time.

	-hpa

