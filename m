Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35122 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754038Ab2DXNgZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Apr 2012 09:36:25 -0400
Message-ID: <4F96AC7F.6080603@suse.cz>
Date: Tue, 24 Apr 2012 15:37:03 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Add error handling to KCONFIG_ALL_CONFIG
References: <m1aa22rllb.fsf@fess.ebiederm.org> <4F96705C.5030901@suse.cz> <m1aa21nxzg.fsf_-_@fess.ebiederm.org> <20120424123305.GA30068@sepie.suse.cz> <m1k415mgrv.fsf@fess.ebiederm.org>
In-Reply-To: <m1k415mgrv.fsf@fess.ebiederm.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org

Dne 24.4.2012 14:54, Eric W. Biederman napsal(a):
> Michal Marek <mmarek@suse.cz> writes:
> 
>> On Tue, Apr 24, 2012 at 04:57:39AM -0700, Eric W. Biederman wrote:
>>>  		name = getenv("KCONFIG_ALLCONFIG");
>>> -		if (name && !stat(name, &tmpstat)) {
>>> -			conf_read_simple(name, S_DEF_USER);
>>> +		if (name && name[0] != '\0') {
>>> +			if (conf_read_simple(name, S_DEF_USER)) {
>>> +				fprintf(stderr,
>>> +					_("*** Can't read seed configuration \"%s\"!\n"),
>>> +					name);
>>> +				exit(1);
>>> +			}
>>>  			break;
>>>  		}
>>>  		switch (input_mode) {
>>
>>
>> Before this patch, the code would fall back to a file named
>> all{no,yes,mod,def,random}.config and then to all.config. Now you require
>> $KCONFIG_ALLCONFIG to always be a file. I suggest we keep the fallback at
>> least for KCONFIG_ALLCONFIG=1, like this:
> 
> I don't require KCONFIG_ALLCONFIG to always be a file if it is an
> empty string we continue to fallback to the predefined file names.
> Which is the currently documented behavior.

Ah, right, it says "If KCONFIG_ALLCONFIG is used without a filename, ...".


> As for KCONFIG_ALLCONFIG=1 if people are a actually doing that the
> complexity seems worth it (to not break muscle memory and/or scripts).
> I was just aiming for an absolutely trivial and simple implementation.
> 
> Why do you think people have been specifying KCONFIG_ALLCONFIG=1?
> instead of simply exporting KCONFIG_ALLCONFIG with an empty string?

I have been using KCONFIG_ALLCONFIG=1 :). It's quite natural to set env
variables to "1" to enable something. But I don't insist that this is
retained.

Michal
