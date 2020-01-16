Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57240 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725973AbgAPI6y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 03:58:54 -0500
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
Date: Thu, 16 Jan 2020 09:58:23 +0100
MIME-Version: 1.0
In-Reply-To: <20200116005741.GB54439@umbus>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, sjg@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Steve McIntyre <steve.mcintyre@linaro.org>

Hi David

On 1/16/20 1:57 AM, David Gibson wrote:
> On Mon, Jan 13, 2020 at 07:16:23PM +0100, Alexandre Torgue wrote:
>> This commit adds the possibility to add build information for a DTB.
>> Build information can be: build date, DTS version, "who built the DTB"
>> (same kind of information that we get in Linux with the Linux banner).
>>
>> To do this, an extra option "-B" using an information file as argument
>> has been added. If this option is used, input device tree is appended with
>> a new string property "Build-info". This property is built with information
>> found in information file given as argument. This file has to be generated
>> by user and shouldn't exceed 256 bytes.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> At the very least, this patch of the series will need to be sent to
> upstream dtc first.

Ok sorry. I thought that sending all the series would give more information.

> 
> I'm also not terribly clear on what you're trying to accomplish here,
> and why it's useful.

Let's take Kernel boot at example (but could be extend to other DTB 
"users" like U-Boot). When Linux kernel booting we get a log that gives 
useful information about kernel image: source version, build date, 
people who built the kernel image, compiler version. This information is 
useful for debug and support. The aim is to get same kind of information 
but for the DTB.

> 
> Since you're doing this specifically for use with dtbs built in the
> kernel build, could you just use a:
> 	Build-info = /incbin/ "build-info.txt";
> in each of the in-kernel .dts files?

My first idea was to not modify all existing .dts files. Adding an extra 
option in dtc is (for me) the softer way to do it. I mean, compile 
information should come through compiler without modify .dts files 
outside from dtc. In this way it will be easy to everybody using dtc 
(inside our outside Linux tree) to add dtb build info (even if they 
don't how to write a dts file).

> 
> Altough you probably shouldn't use "Build-info" since it doesn't match
> device tree property naming conventions.  My suggestion would be
> "linux,build-info".

Yes I agree but something like "dtb-info" would be better as this 
property can be added when dtb is built for Linux but also for U-Boot.

> 
>> diff --git a/scripts/dtc/dtc.c b/scripts/dtc/dtc.c
>> index bdb3f5945699..294828bac20b 100644
>> --- a/scripts/dtc/dtc.c
>> +++ b/scripts/dtc/dtc.c
>> @@ -18,6 +18,7 @@ int padsize;		/* Additional padding to blob */
>>   int alignsize;		/* Additional padding to blob accroding to the alignsize */
>>   int phandle_format = PHANDLE_EPAPR;	/* Use linux,phandle or phandle properties */
>>   int generate_symbols;	/* enable symbols & fixup support */
>> +int generate_build_info;	/* Add build information: time, source version ... */
>>   int generate_fixups;		/* suppress generation of fixups on symbol support */
>>   int auto_label_aliases;		/* auto generate labels -> aliases */
>>   int annotate;		/* Level of annotation: 1 for input source location
>> @@ -45,9 +46,42 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
>>   		fill_fullpaths(child, tree->fullpath);
>>   }
>>   
>> +static void fill_build_info(struct node *tree, const char *fname)
>> +{
>> +	struct data d = empty_data;
>> +	char *tmp;
>> +	FILE *f;
>> +	int len;
>> +
>> +	tmp = xmalloc(sizeof(char) * 256);
>> +
>> +	f = fopen(fname, "r");
>> +	if (!f) {
>> +		printf("Can't open file %s\n", fname);
>> +		return;
>> +	}
>> +
>> +	len = fread(tmp, sizeof(char), 256, f);
>> +	if (!len) {
>> +		printf("Can't read file %s\n", fname);
>> +		fclose(f);
>> +		free(tmp);
>> +	}
>> +	fclose(f);
> 
> You have no useful error reporting if the file is larger than the limit.

Ok. To fix.

> 
>> +
>> +	tmp[len - 1] = '\0';
>> +
>> +	d = data_add_marker(d, TYPE_STRING, tmp);
>> +	d = data_append_data(d, tmp, len);
> 
> You can essentially do this better with data_copy_file().

I will try with data_copy_file(). Thanks.

> 
>> +
>> +	add_property(tree, build_property("Build-info", d, NULL));
>> +
>> +	free(tmp);
>> +}
>> +
>>   /* Usage related data. */
>>   static const char usage_synopsis[] = "dtc [options] <input file>";
>> -static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@AThv";
>> +static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@AT:B:hv";
>>   static struct option const usage_long_opts[] = {
>>   	{"quiet",            no_argument, NULL, 'q'},
>>   	{"in-format",         a_argument, NULL, 'I'},
>> @@ -69,6 +103,7 @@ static struct option const usage_long_opts[] = {
>>   	{"symbols",	     no_argument, NULL, '@'},
>>   	{"auto-alias",       no_argument, NULL, 'A'},
>>   	{"annotate",         no_argument, NULL, 'T'},
>> +	{"build-info",	      a_argument, NULL, 'B'},
>>   	{"help",             no_argument, NULL, 'h'},
>>   	{"version",          no_argument, NULL, 'v'},
>>   	{NULL,               no_argument, NULL, 0x0},
>> @@ -106,6 +141,7 @@ static const char * const usage_opts_help[] = {
>>   	"\n\tEnable generation of symbols",
>>   	"\n\tEnable auto-alias of labels",
>>   	"\n\tAnnotate output .dts with input source file and line (-T -T for more details)",
>> +	"\n\tAdd build information (date, version, ...) in the blob",
>>   	"\n\tPrint this help and exit",
>>   	"\n\tPrint version and exit",
>>   	NULL,
>> @@ -164,6 +200,7 @@ int main(int argc, char *argv[])
>>   	const char *outform = NULL;
>>   	const char *outname = "-";
>>   	const char *depname = NULL;
>> +	const char *version = NULL;
>>   	bool force = false, sort = false;
>>   	const char *arg;
>>   	int opt;
>> @@ -256,9 +293,12 @@ int main(int argc, char *argv[])
>>   		case 'T':
>>   			annotate++;
>>   			break;
>> -
>>   		case 'h':
>>   			usage(NULL);
>> +		case 'B':
>> +			version = optarg;
>> +			generate_build_info = 1;
>> +			break;
>>   		default:
>>   			usage("unknown option");
>>   		}
>> @@ -296,14 +336,17 @@ int main(int argc, char *argv[])
>>   	}
>>   	if (annotate && (!streq(inform, "dts") || !streq(outform, "dts")))
>>   		die("--annotate requires -I dts -O dts\n");
>> -	if (streq(inform, "dts"))
>> +	if (streq(inform, "dts")) {
>>   		dti = dt_from_source(arg);
>> -	else if (streq(inform, "fs"))
>> +		if (generate_build_info)
>> +			fill_build_info(dti->dt, version);
>> +	} else if (streq(inform, "fs")) {
>>   		dti = dt_from_fs(arg);
>> -	else if(streq(inform, "dtb"))
>> +	} else if (streq(inform, "dtb")) {
>>   		dti = dt_from_blob(arg);
>> -	else
>> +	} else {
>>   		die("Unknown input format \"%s\"\n", inform);
>> +	}
>>   
>>   	dti->outname = outname;
>>   
> 
