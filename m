Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out03.mta.xmission.com ([166.70.13.233]:34917 "EHLO
	out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752752Ab2DXMvB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Apr 2012 08:51:01 -0400
From: ebiederm@xmission.com (Eric W. Biederman)
References: <m1aa22rllb.fsf@fess.ebiederm.org> <4F96705C.5030901@suse.cz>
	<m1aa21nxzg.fsf_-_@fess.ebiederm.org>
	<20120424123305.GA30068@sepie.suse.cz>
Date: Tue, 24 Apr 2012 05:54:44 -0700
In-Reply-To: <20120424123305.GA30068@sepie.suse.cz> (Michal Marek's message of
	"Tue, 24 Apr 2012 14:33:05 +0200")
Message-ID: <m1k415mgrv.fsf@fess.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH] kbuild: Add error handling to KCONFIG_ALL_CONFIG
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org

Michal Marek <mmarek@suse.cz> writes:

> On Tue, Apr 24, 2012 at 04:57:39AM -0700, Eric W. Biederman wrote:
>>  		name = getenv("KCONFIG_ALLCONFIG");
>> -		if (name && !stat(name, &tmpstat)) {
>> -			conf_read_simple(name, S_DEF_USER);
>> +		if (name && name[0] != '\0') {
>> +			if (conf_read_simple(name, S_DEF_USER)) {
>> +				fprintf(stderr,
>> +					_("*** Can't read seed configuration \"%s\"!\n"),
>> +					name);
>> +				exit(1);
>> +			}
>>  			break;
>>  		}
>>  		switch (input_mode) {
>
>
> Before this patch, the code would fall back to a file named
> all{no,yes,mod,def,random}.config and then to all.config. Now you require
> $KCONFIG_ALLCONFIG to always be a file. I suggest we keep the fallback at
> least for KCONFIG_ALLCONFIG=1, like this:

I don't require KCONFIG_ALLCONFIG to always be a file if it is an
empty string we continue to fallback to the predefined file names.
Which is the currently documented behavior.

As for KCONFIG_ALLCONFIG=1 if people are a actually doing that the
complexity seems worth it (to not break muscle memory and/or scripts).
I was just aiming for an absolutely trivial and simple implementation.

Why do you think people have been specifying KCONFIG_ALLCONFIG=1?
instead of simply exporting KCONFIG_ALLCONFIG with an empty string?

Eric


> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index f208f90..36efc8f 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -574,9 +574,17 @@ int main(int ac, char **av)
>  	case alldefconfig:
>  	case randconfig:
>  		name = getenv("KCONFIG_ALLCONFIG");
> -		if (name && !stat(name, &tmpstat)) {
> -			conf_read_simple(name, S_DEF_USER);
> -			break;
> +		if (name && name[0] != '\0') {
> +			if (conf_read_simple(name, S_DEF_USER)) {
> +				if (strcmp(name, "1") != 0) {
> +					fprintf(stderr,
> +						_("*** Can't read seed configuration \"%s\"!\n"),
> +						name);
> +					exit(1);
> +				}
> +			} else {
> +				break;
> +			}
>  		}
>  		switch (input_mode) {
>  		case allnoconfig:	name = "allno.config"; break;
> @@ -586,10 +594,13 @@ int main(int ac, char **av)
>  		case randconfig:	name = "allrandom.config"; break;
>  		default: break;
>  		}
> -		if (!stat(name, &tmpstat))
> -			conf_read_simple(name, S_DEF_USER);
> -		else if (!stat("all.config", &tmpstat))
> -			conf_read_simple("all.config", S_DEF_USER);
> +		if (conf_read_simple(name, S_DEF_USER) &&
> +				conf_read_simple("all.config", S_DEF_USER)) {
> +			fprintf(stderr,
> +				_("*** KCONFIG_ALLCONFIG=1 set, but no \"%s\" or \"all.config\" file found\n"),
> +				name);
> +			exit(1);
> +		}
>  		break;
>  	default:
>  		break;
>
>
> And update Documentation/kbuild/kconfig.txt.
>
> Michal
