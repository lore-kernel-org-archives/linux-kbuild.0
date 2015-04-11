Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53894 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755299AbbDKTyN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Apr 2015 15:54:13 -0400
Message-ID: <55297BE2.60401@suse.cz>
Date: Sat, 11 Apr 2015 21:54:10 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: add documentation of KBUILD_BUILD_VERSION
References: <1428216268-3545-1-git-send-email-hofrat@osadl.org> <20150411151523.1756ec20@lwn.net> <20150411132023.GA22172@opentech.at>
In-Reply-To: <20150411132023.GA22172@opentech.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Mc Guire <der.herr@hofr.at>, Jonathan Corbet <corbet@lwn.net>
Cc: Nicholas Mc Guire <hofrat@osadl.org>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 11.4.2015 v 15:20 Nicholas Mc Guire napsal(a):
> On Sat, 11 Apr 2015, Jonathan Corbet wrote:
> 
>> On Sun,  5 Apr 2015 08:44:28 +0200
>> Nicholas Mc Guire <hofrat@osadl.org> wrote:
>>
>>> KBUILD_BUILD_VERSION is currently not documented but it is
>>> needed when rebuilding a kernel that should result in the identical
>>> binary. This is a brief documentation of KBUILD_BUILD_VERSION.
>>
>> Can we add something like the above to the document itself so that
>> readers have an idea of why they might want to tweak this?
>>
>> Either way, I can take it in the docs tree if that's best..Michal?
>>
> I thought of that but it would be inconsistent as all other descriptions
> here are only the function not the use.

Most of the entries in this file predate efforts at deterministic
builds, so I'd prefer usefulness over consistency here :-).


> I did not find a file where 
> the problem of identical rebuild would really fit.

... unless, of course, you want to start a new file covering this topic.
Because it's not just the few override variables, but also some options
have to be turned off (I remember CONFIG_GCOV_KERNEL) and the paths must
be the same, or relative paths must be used.

Michal
