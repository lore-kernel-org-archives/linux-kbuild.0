Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews01.kpnxchange.com ([213.75.39.4]:58167 "EHLO
	cpsmtpb-ews01.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753681AbaKDN2R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 08:28:17 -0500
Message-ID: <1415107695.20372.153.camel@x220>
Subject: Re: [PATCH 2/2] kconfig: allow use of relations other than
 (in)equality
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 04 Nov 2014 14:28:15 +0100
In-Reply-To: <5458E0C80200007800044D43@mail.emea.novell.com>
References: <5458A52C0200007800044AC4@mail.emea.novell.com>
	 <1415106861.20372.149.camel@x220>
	 <5458E0C80200007800044D43@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org

On Tue, 2014-11-04 at 13:20 +0000, Jan Beulich wrote:
> >> +	if (k1 == k_string || k2 == k_string)
> >> +		res = strcmp(str1, str2);
> >> +	else if (k1 == k_invalid || k2 == k_invalid) {
> >> +		if (e->type != E_EQUAL && e->type != E_UNEQUAL) {
> >> +			printf("Cannot compare \"%s\" and \"%s\"\n", str1, str2);
> >> +printf("(%s -> %d, %s -> %d)\n", sym_type_name(e->left.sym->type), k1, 
> > sym_type_name(e->right.sym->type), k2);//temp
> > 
> > Leftover from development?
> 
> Argh - yes, definitely; I even have a note in the patch that these
> should get dropped, but I managed to ignore that note.

If all you have to change is drop those three lines, I'll play with this
patch anyway, as I finally maltreated it enough to apply on top of my
local changes.


Paul Bolle

