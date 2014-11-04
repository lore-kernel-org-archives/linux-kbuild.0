Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:39486 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751841AbaKDOPH convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
	Tue, 4 Nov 2014 09:15:07 -0500
Message-Id: <5458ED780200007800044DAA@mail.emea.novell.com>
Date: Tue, 04 Nov 2014 14:15:04 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] kconfig: allow use of relations other than
 (in)equality
References: <5458A52C0200007800044AC4@mail.emea.novell.com>
 <1415106861.20372.149.camel@x220>
 <5458E0C80200007800044D43@mail.emea.novell.com>
 <1415107695.20372.153.camel@x220>
In-Reply-To: <1415107695.20372.153.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org

>>> On 04.11.14 at 14:28, <pebolle@tiscali.nl> wrote:
> On Tue, 2014-11-04 at 13:20 +0000, Jan Beulich wrote:
>> >> +	if (k1 == k_string || k2 == k_string)
>> >> +		res = strcmp(str1, str2);
>> >> +	else if (k1 == k_invalid || k2 == k_invalid) {
>> >> +		if (e->type != E_EQUAL && e->type != E_UNEQUAL) {
>> >> +			printf("Cannot compare \"%s\" and \"%s\"\n", str1, str2);
>> >> +printf("(%s -> %d, %s -> %d)\n", sym_type_name(e->left.sym->type), k1, 
>> > sym_type_name(e->right.sym->type), k2);//temp
>> > 
>> > Leftover from development?
>> 
>> Argh - yes, definitely; I even have a note in the patch that these
>> should get dropped, but I managed to ignore that note.
> 
> If all you have to change is drop those three lines, I'll play with this
> patch anyway, as I finally maltreated it enough to apply on top of my
> local changes.

Yes, unless other comments require me to make further changes,
this is all I currently see needing adjustment and re-sending.

Jan

