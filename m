Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:38584 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758184Ab1DZVLd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 17:11:33 -0400
Message-ID: <4DB734DB.9000904@verizon.net>
Date: Tue, 26 Apr 2011 17:10:51 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: fix sed error in export_report.pl
References: <4DB608EE.1060502@verizon.net> <4DB6D959.6090008@suse.cz>
In-Reply-To: <4DB6D959.6090008@suse.cz>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 4/26/2011 10:40 AM, Michal Marek wrote:
> On 26.4.2011 01:51, Peter Foley wrote:
>> This patch fixes a sed error in export_report.pl by escaping a $.
>>
>> Signed-off-by: Peter Foley<pefoley2@verizon.net>
>> ---
>>   scripts/export_report.pl |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/scripts/export_report.pl b/scripts/export_report.pl
>> index 04dce7c..91fa5a2 100644
>> --- a/scripts/export_report.pl
>> +++ b/scripts/export_report.pl
>> @@ -50,7 +50,7 @@ sub usage {
>>    sub collectcfiles {
>>       my @file
>> -    = `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko$/.mod.c/`;
>> +    = `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed
>> s/\.ko\$/.mod.c/`;
> 
> Please enclose the argument in single quotes instead.
> 
> Michal

I tried doing that and still got:
perl /usr/src/git/scripts/export_report.pl
sed: -e expression #1, char 5: unterminated `s' command

Peter
