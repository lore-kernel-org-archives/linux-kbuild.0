Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33174 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751440AbaBMKV5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Feb 2014 05:21:57 -0500
Message-ID: <52FC9CBD.5010702@suse.cz>
Date: Thu, 13 Feb 2014 11:21:49 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH RFC] kernel build: enable use of password-protected signing
 keys
References: <52F8034B.8080303@mykolab.com> <52F8D94D.4040307@suse.cz> <52FBF8A8.1010304@mykolab.com>
In-Reply-To: <52FBF8A8.1010304@mykolab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emily Maier <emilymaier@mykolab.com>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 2014-02-12 23:41, Emily Maier wrote:
> On 02/10/2014 08:51 AM, Michal Marek wrote:
>> On 9.2.2014 23:38, Emily Maier wrote:
>>> Currently, the module signing script assumes that the private key is 
>>> not password-protected. This patch makes it slightly more secure by 
>>> allowing it to be passed in on the command line as "make 
>>> modules_install MOD_PASSWORD=abc". It's vulnerable to snooping during 
>>> the build of course, but so is an unprotected signing key.
>>
>> The key's permissions can be set to 0600, while the make commandline is
>> visible in ps.
> 
> Ok, I'll change it to that and look into other options as well. I think
> there may be a way to pass it to OpenSSL off disk and the command line
> entirely.
> 
> Would it be appropriate to add Kconfig options for this or try to
> autodetect the password file?

What some vendors do is that they have the modules signed by a signing
machine that is separated from the build farm. So they typically unset
MODULE_SIG_ALL and handle the signing outside kbuild. The other option
is to have a wrapper for the openssl command, not sure if anybody is
doing that.

Michal
