Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:42394 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752342AbbAPQcr convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:4:1>);
	Fri, 16 Jan 2015 11:32:47 -0500
Message-Id: <54B94B3E0200007800055F77@mail.emea.novell.com>
Date: Fri, 16 Jan 2015 16:32:46 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] kconfig: don't silently ignore unhandled
 characters
References: <54B93FE60200007800055E84@mail.emea.novell.com>
 <1421425532.8562.32.camel@x220>
In-Reply-To: <1421425532.8562.32.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

>>> On 16.01.15 at 17:25, <pebolle@tiscali.nl> wrote:
> On Fri, 2015-01-16 at 15:44 +0000, Jan Beulich wrote:
>>  scripts/kconfig/zconf.l             |    7 +
>>  scripts/kconfig/zconf.lex.c_shipped |  195 +++++++++++++++++++-----------------
>>  sound/soc/intel/Kconfig             |    4 
> 
> I guess Michal would like to split the c_shipped changes in this patch
> too. (I personally don't care.) And I think the sound/soc/intel/Kconfig
> should be a separate patch. 

I simply didn't want the patch to create fallout (even if it's just
warnings). If doing this here is deemed inappropriate, I'd likely
drop the adjustment altogether and just mention the effect the
patch has. Following up with the various subsystem maintainers
until they pick up patches is, hmm, difficult.

Jan

