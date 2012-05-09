Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:24548 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757213Ab2EIOSD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 May 2012 10:18:03 -0400
Message-ID: <4FAA7C9A.2060808@linux.intel.com>
Date: Wed, 09 May 2012 07:18:02 -0700
From: "H. Peter Anvin" <hpa@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 04/23] x86, realmode: Move reboot_32.S to unified realmode
 code
References: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com> <1336501366-28617-5-git-send-email-jarkko.sakkinen@intel.com> <4FAA18F1.6080508@redhat.com> <alpine.DEB.2.02.1205091525100.6943@jsakkine-mobl2.(null)> <4FAA76E7.1070807@linux.intel.com> <4FAA7C06.1060209@redhat.com>
In-Reply-To: <4FAA7C06.1060209@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@intel.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joseph Cihula <joseph.cihula@intel.com>, Shane Wang <shane.wang@intel.com>

On 05/09/2012 07:15 AM, Paolo Bonzini wrote:
> 
> I'm not sure I understand.  The code has
> 
> 	andl	$0x60000000, %edx	; clear ET/PE
> 	jz	2f
> 	...
> 2:
> 	andb	$0x10, %dl		; clear CD/WT, %edx is always 0
> 
> 
> What I've suggested is:
> 
> 	testl	$0x60000000, %edx
> 	jz	2f
> 	...
> 2:
> 	andb	$0x10, %dl		; clear PE only
> 
> 
> What would jump to the BIOS with caches on is:
> 
> 	testl	$0x60000000, %edx
> 	jz	2f
> 	...
> 2:
> 	andl	$0x10, %edx		; Clear CD/WT/PE
> 
> 
> Am I missing something?
> 

Not awake yet, sorry...

	-hpa


