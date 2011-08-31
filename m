Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:48124 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752772Ab1HaIji convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 04:39:38 -0400
Received: by ewy4 with SMTP id 4so244941ewy.19
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 01:39:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACqU3MX7=QmhQjq_6OeLGDfwSPLHzYYUg0wF3BY8iz17s2L0TA@mail.gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
	<1314662164-8565-1-git-send-email-crquan@gmail.com>
	<1314662164-8565-2-git-send-email-crquan@gmail.com>
	<1314662164-8565-3-git-send-email-crquan@gmail.com>
	<1314662164-8565-4-git-send-email-crquan@gmail.com>
	<CACqU3MX7=QmhQjq_6OeLGDfwSPLHzYYUg0wF3BY8iz17s2L0TA@mail.gmail.com>
Date: Wed, 31 Aug 2011 11:39:36 +0300
Message-ID: <CAMT+=WYZZ4LvoWCaeAtxrPZEudLE6cCoVfFTHCTj16jJL6MQww@mail.gmail.com>
Subject: Re: [PATCH 4/5] scripts/kconfig/nconf: fix editing long strings
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Cheng Renquan <crquan@gmail.com>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

Hello.

On Tue, Aug 30, 2011 at 7:59 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Hi,
>
> On Mon, Aug 29, 2011 at 7:56 PM, Cheng Renquan <crquan@gmail.com> wrote:
>> The original dialog_inputbox doesn't work with longer than prompt_width
>> strings, here fixed it in this way:
>>
>> 1) add variable cursor_form_win to record cursor of form_win,
>>   keep its value always between [0, prompt_width-1];
>>   keep the original cursor_position as cursor of the string result,
>>   for short strings, cursor_form_win is identical to cursor_position;
>>   for long strings, use (cursor_position-cursor_form_win) as begin offset
>>   to show part of the string in form_win;
>>
>
>> 2) whenever cursor of form_win is near (by 3 chars) to left or right edge
>>   of form_win, make a auto scroll by half prompt_width, to make this one
>>   line string editor more fun to use;
>>
> I am not a huge fan of this behavior, it seems a bit chaotic and
> unnatural to me.


I agree with Arnaud. Jumping the line is chaotic. I believe that
scrolling the string view one character left (or right)-wise is a
better solution.


> menuconfig's (partial) support of long string seem more stable. When
> you erase a long string, the cursor move left. When you end up on the
> edge, the window slide left fully, which let you see either a full
> window again, or the beginning of the string. Unfortunately, you
> cannot scroll within the string, but I would expect that when you
> reach the right of the window, and continue typing, to see the window
> moves right, without this "come back" effect.
>
> Beside that, I agree, it's a huge improvement :)
>
>  - Arnaud
>
>> 3) update len for later cursor_form_win correct calculation;
>>
>> Signed-off-by: Cheng Renquan <crquan@gmail.com>
>> ---
>>  scripts/kconfig/nconf.gui.c |   43 +++++++++++++++++++++++++++++++++++++------
>>  1 files changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
>> index bc482ad..62a41d1 100644
>> --- a/scripts/kconfig/nconf.gui.c
>> +++ b/scripts/kconfig/nconf.gui.c
>> @@ -367,6 +367,7 @@ int dialog_inputbox(WINDOW *main_window,
>>        int i, x, y;
>>        int res = -1;
>>        int cursor_position = strlen(init);
>> +       int cursor_form_win;
>>
>>        if (strlen(init) > *result_len) {
>>                do {
>> @@ -413,7 +414,9 @@ int dialog_inputbox(WINDOW *main_window,
>>        fill_window(prompt_win, prompt);
>>
>>        mvwprintw(form_win, 0, 0, "%*s", prompt_width, " ");
>> -       mvwprintw(form_win, 0, 0, "%s", result);
>> +       cursor_form_win = min(cursor_position, prompt_width-1);
>> +       mvwprintw(form_win, 0, 0, "%s",
>> +                 result + cursor_position-cursor_form_win);
>>
>>        /* create panels */
>>        panel = new_panel(win);
>> @@ -439,6 +442,8 @@ int dialog_inputbox(WINDOW *main_window,
>>                                                &result[cursor_position],
>>                                                len-cursor_position+1);
>>                                cursor_position--;
>> +                               cursor_form_win--;
>> +                               len--;
>>                        }
>>                        break;
>>                case KEY_DC:
>> @@ -446,18 +451,22 @@ int dialog_inputbox(WINDOW *main_window,
>>                                memmove(&result[cursor_position],
>>                                                &result[cursor_position+1],
>>                                                len-cursor_position+1);
>> +                               len--;
>>                        }
>>                        break;
>>                case KEY_UP:
>>                case KEY_RIGHT:
>> -                       if (cursor_position < len &&
>> -                           cursor_position < min(*result_len, prompt_width))
>> +                       if (cursor_position < len) {
>>                                cursor_position++;
>> +                               cursor_form_win++;
>> +                       }
>>                        break;
>>                case KEY_DOWN:
>>                case KEY_LEFT:
>> -                       if (cursor_position > 0)
>> +                       if (cursor_position > 0) {
>>                                cursor_position--;
>> +                               cursor_form_win--;
>> +                       }
>>                        break;
>>                default:
>>                        if ((isgraph(res) || isspace(res))) {
>> @@ -475,16 +484,38 @@ int dialog_inputbox(WINDOW *main_window,
>>                                                len-cursor_position+1);
>>                                result[cursor_position] = res;
>>                                cursor_position++;
>> +                               cursor_form_win++;
>> +                               len++;
>>                        } else {
>>                                mvprintw(0, 0, "unknown key: %d\n", res);
>>                        }
>>                        break;
>>                }
>> +               if (len <= prompt_width-1)
>> +                       cursor_form_win = cursor_position;
>> +               else {
>> +                       if (cursor_form_win <= 3)
>> +                               cursor_form_win += prompt_width/2;
>> +                       else if (cursor_form_win >= prompt_width-3)
>> +                               cursor_form_win -= prompt_width/2;
>> +
>> +                       if (cursor_form_win < 0)
>> +                               cursor_form_win = 0;
>> +                       else if (cursor_form_win >= prompt_width-1)
>> +                               cursor_form_win = prompt_width-1;
>> +
>> +                       if (cursor_form_win > cursor_position)
>> +                               cursor_form_win = cursor_position;
>> +                       if (cursor_form_win < (prompt_width-1) - (len-cursor_position))
>> +                               cursor_form_win = (prompt_width-1) - (len-cursor_position);
>> +               }
>> +
>>                wmove(form_win, 0, 0);
>>                wclrtoeol(form_win);
>>                mvwprintw(form_win, 0, 0, "%*s", prompt_width, " ");
>> -               mvwprintw(form_win, 0, 0, "%s", result);
>> -               wmove(form_win, 0, cursor_position);
>> +               mvwprintw(form_win, 0, 0, "%s",
>> +                       result + cursor_position-cursor_form_win);
>> +               wmove(form_win, 0, cursor_form_win);
>>                touchwin(win);
>>                refresh_all_windows(main_window);
>>
>> --
>> 1.7.6
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
