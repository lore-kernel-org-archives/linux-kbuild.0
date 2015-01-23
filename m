Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36770 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753314AbbAWKzP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Jan 2015 05:55:15 -0500
Message-ID: <54C22891.6070506@suse.cz>
Date: Fri, 23 Jan 2015 11:55:13 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] modsign: provide option to automatically delete the key
 after modules were installed
References: <1421976009-9819-1-git-send-email-holler@ahsoftware.de> <54C21361.1080500@suse.cz> <54C216D8.8040004@ahsoftware.de> <54C21F35.1040206@ahsoftware.de>
In-Reply-To: <54C21F35.1040206@ahsoftware.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Holler <holler@ahsoftware.de>, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>

On 2015-01-23 11:15, Alexander Holler wrote:
> Am 23.01.2015 um 10:39 schrieb Alexander Holler:
>> Am 23.01.2015 um 10:24 schrieb Michal Marek:
>>
>>>> +	@rm ./signing_key.priv
>>>> +	@rm ./signing_key.x509
>>>
>>> Why do you need to delete the certificate?
>>
>> No special reason.
>>
>> I'm just not sure (and too lazy to look it up) if it might contain the
>> private key too (like it's possible in pem files), so I've deleted it too.
> 
> Or in other words, while .priv leads me to the educated guess that it 
> contains the private key, .x509 doesn't give me an obvious indication 
> what it contains.
> 
> If someone assures me that .x509 doesn't contain the private key 
> necessary to sign the modules, I'll send a v2 of the patch.

The .x509 file contains a certificate signed by the private key, but not
the private key. With some scripting, it can be used to verify the
module signatures.

Michal

